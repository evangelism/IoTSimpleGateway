using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System.Threading.Tasks;
using Microsoft.Azure;
using System.IO;

namespace Gateway
{
    class AzureStorageClient
    {
        static private CloudStorageAccount storageAccount;
        static private CloudBlobClient blobClient;
        static private CloudBlobContainer container;
        public AzureStorageClient()
        {
            storageAccount = CloudStorageAccount.Parse(
            CloudConfigurationManager.GetSetting("AzureStorageConnectionString"));
            blobClient = storageAccount.CreateCloudBlobClient();
            container = blobClient.GetContainerReference("telemetry");
            container.CreateIfNotExists();
        }

        public void PutBlob(string content)
        {
            CloudAppendBlob blob = container.GetAppendBlobReference("telemetry.txt");
            
            using (var stream = new MemoryStream(Encoding.Default.GetBytes(content), false))
            {
                blob.UploadFromStream(stream, null);
            }
        }
        
    }
}
