<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="KvartaCloudIoTGateway" generation="1" functional="0" release="0" Id="66a473a4-8981-4639-95fe-acd015a843fa" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="KvartaCloudIoTGatewayGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/LB:Gateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inToChannel>
        </inPort>
        <inPort name="Gateway:TCPEndpoint" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/LB:Gateway:TCPEndpoint" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapCertificate|Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="Gateway:APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:APPINSIGHTS_INSTRUMENTATIONKEY" />
          </maps>
        </aCS>
        <aCS name="Gateway:AzureStorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:AzureStorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="Gateway:iqfreezetelemetrystorage_AzureStorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:iqfreezetelemetrystorage_AzureStorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="Gateway:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </maps>
        </aCS>
        <aCS name="GatewayInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/MapGatewayInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:Gateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput">
          <toPorts>
            <inPortMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:Gateway:TCPEndpoint">
          <toPorts>
            <inPortMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/TCPEndpoint" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapCertificate|Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapGateway:APPINSIGHTS_INSTRUMENTATIONKEY" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/APPINSIGHTS_INSTRUMENTATIONKEY" />
          </setting>
        </map>
        <map name="MapGateway:AzureStorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/AzureStorageConnectionString" />
          </setting>
        </map>
        <map name="MapGateway:iqfreezetelemetrystorage_AzureStorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/iqfreezetelemetrystorage_AzureStorageConnectionString" />
          </setting>
        </map>
        <map name="MapGateway:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapGateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapGateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </setting>
        </map>
        <map name="MapGatewayInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/GatewayInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Gateway" generation="1" functional="0" release="0" software="C:\Dev\KvartaCloudIoTGateway\KvartaCloudIoTGateway\csx\Debug\roles\Gateway" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp" />
              <inPort name="TCPEndpoint" protocol="tcp" portRanges="10100" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/SW:Gateway:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="" />
              <aCS name="AzureStorageConnectionString" defaultValue="" />
              <aCS name="iqfreezetelemetrystorage_AzureStorageConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Gateway&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Gateway&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;e name=&quot;TCPEndpoint&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="LocalStorage1" defaultAmount="[10,10,10]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/GatewayInstances" />
            <sCSPolicyUpdateDomainMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/GatewayUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/GatewayFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="GatewayUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="GatewayFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="GatewayInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="b9c3d156-382c-4ec1-b98d-389f692abb18" ref="Microsoft.RedDog.Contract\ServiceContract\KvartaCloudIoTGatewayContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="3d0e94d4-682f-4f2c-a2b8-7e02c4724261" ref="Microsoft.RedDog.Contract\Interface\Gateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="83c0ca9a-5292-49c5-a05a-49e87a2d1307" ref="Microsoft.RedDog.Contract\Interface\Gateway:TCPEndpoint@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/KvartaCloudIoTGateway/KvartaCloudIoTGatewayGroup/Gateway:TCPEndpoint" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>