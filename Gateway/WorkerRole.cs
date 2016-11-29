using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using System.Net.Sockets;
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.ApplicationInsights;
using System.IO;
using System.Text;

namespace Gateway
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
        private readonly ManualResetEvent runCompleteEvent = new ManualResetEvent(false);
        AzureStorageClient azureStorageClient = new AzureStorageClient();

        IPEndPoint instEndpoint = RoleEnvironment.CurrentRoleInstance.InstanceEndpoints["TCPEndpoint"].IPEndpoint;
      public override void Run()
        {
            Trace.TraceInformation("Gateway is running");
            //TelemetryConfiguration.Active.InstrumentationKey = RoleEnvironment.GetConfigurationSettingValue("APPINSIGHTS_INSTRUMENTATIONKEY");

            try
            {
                this.RunAsync(this.cancellationTokenSource.Token).Wait();
            }
            finally
            {
                this.runCompleteEvent.Set();
            }
        }

        public override bool OnStart()
        {
            ServicePointManager.DefaultConnectionLimit = 12;
            bool result = base.OnStart();
            
            Trace.TraceInformation("Gateway has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("Gateway is stopping");

            this.cancellationTokenSource.Cancel();
            this.runCompleteEvent.WaitOne();

            base.OnStop();

            Trace.TraceInformation("Gateway has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            while (!cancellationToken.IsCancellationRequested)
            {
                Trace.TraceInformation("Working");
                await Task.Delay(1000);

                //In the runtime, we get the deployment IP and merging it with the TCP/IP port
                TcpListener server = null;  
                IPAddress localAddr = IPAddress.Parse(instEndpoint.Address.ToString());
               
                server = new TcpListener(localAddr, instEndpoint.Port);
                server.Start();

                //Application Insights initialization
                //TelemetryClient telemetry = new TelemetryClient();
                //telemetry.TrackEvent(localAddr.ToString() + "" + instEndpoint.Port);


                //Initialization of Cloud Service Local Storage - can be deleted, only for testing. Local Storage can be
                //configured in the Role settings.
                const string azureLocalResourceNameFromServiceDefinition = "LocalStorage1";
                var azureLocalResource = RoleEnvironment.GetLocalResource(azureLocalResourceNameFromServiceDefinition);
                                
                //It is a simple way to check if we really receive any telemetry from TCPListener
                var filepath = azureLocalResource.RootPath + "telemetry.txt";
                //System.IO.File.AppendAllText(filepath, localAddr.ToString() + "" + instEndpoint.Port);

                //We can put the new blob to the Azure Storage - AzureStorageClient.cs
                azureStorageClient.PutBlob("test");

                //starting to listen for the telemetry by 514 bytes packets. Need to be adjusted
                //according to the protocol (probably, size can be different)
                Byte[] bytes = new Byte[514];
                String data = null;

                while (true)
                {
                    TcpClient client = server.AcceptTcpClient();
                    
                    data = null;
                    NetworkStream stream = client.GetStream();
                   
                    int i;
                    StreamWriter writer = new StreamWriter(client.GetStream(),                                  Encoding.ASCII);
                    while ((i = stream.Read(bytes, 0, bytes.Length)) != 0)
                    {

                        data = System.Text.Encoding.ASCII.GetString(bytes, 0, i);

                        //Here, writing to the Local Storage file/putting that into the Storage blob
                        System.IO.File.AppendAllText(filepath, BitConverter.ToString(bytes));
                        azureStorageClient.PutBlob(BitConverter.ToString(bytes));
                   
                        //Writing confirmation according to the specification

                        //writer.Write(String.Format("DATA ACCEPT={0}", BitConverter.ToString(bytes, 10, 3)));
                        //stream.Write(bytes, 10, 1);

                    }
                    client.Close();
                }
            }
        }

        public static byte[] FromHex(string hex)
        {
            hex = hex.Replace("-", "");
            byte[] raw = new byte[hex.Length / 2];
            for (int i = 0; i < raw.Length; i++)
            {
                raw[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);
            }
            return raw;
        }


    }
}
