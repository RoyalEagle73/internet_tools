require 'rspec'
require '../lib/internet_tools'
require 'webmock/rspec'

RSpec.describe "tests for internet tools" do
    let(:internetTools){InternetTools.new}
    let(:mock) {double(internetTools)}
        
    context "# nslookup " do
        let(:validURL){"cerner.com"}
        let(:invalidURL){"github"}
        
        context "When user does not provides custom DNS" do
            
            it "program returns lookup for valid URL" do
                output = {"server"=>"172.23.160.1", "address"=>"172.23.160.1#53", "ip details"=>{"0"=>{"name"=>"cerner.com", "address"=>" 10.182.234.43"}, "1"=>{"name"=>"cerner.com", "address"=>" 10.181.204.21"}, "2"=>{"name"=>"cerner.com", "address"=>" 10.160.203.34"}, "3"=>{"name"=>"cerner.com", "address"=>" 10.171.34.154"}, "4"=>{"name"=>"cerner.com", "address"=>" 10.181.192.57"}, "5"=>{"name"=>"cerner.com", "address"=>" 10.182.237.203"}, "6"=>{"name"=>"cerner.com", "address"=>" 10.162.203.98"}, "7"=>{"name"=>"cerner.com", "address"=>" 10.181.161.135"}, "8"=>{"name"=>"cerner.com", "address"=>" 159.140.213.101"}, "9"=>{"name"=>"cerner.com", "address"=>" 159.140.2.66"}, "10"=>{"name"=>"cerner.com", "address"=>" 159.140.213.79"}, "11"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::ab6:ea2b"}, "12"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::ab5:cc15"}, "13"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::aa0:cb22"}, "14"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::aab:229a"}, "15"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::ab5:c039"}, "16"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::ab6:edcb"}, "17"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::aa2:cb62"}, "18"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::ab5:a187"}, "19"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::9f8c:d565"}, "20"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::9f8c:242"}, "21"=>{"name"=>"cerner.com", "address"=>" fd24:5310:6106:7777::9f8c:d54f"}}}
                allow(mock).to receive(:nslookup) {output}
                expect(mock.nslookup validURL).to include(output)
            end

            it "program returns empty lookup for inavlid url" do
                output = {"server"=>"172.23.160.1", "address"=>"172.23.160.1#53", "ip details"=>{}}
                expect(internetTools.nslookup invalidURL).to include(output)
            end

        end
        
        context "When user does provides custom DNS" do
            let(:customDNS) { "1.1.1.1" }
            it "programs returns lookup for valid URL" do
                output = {"server"=>"1.1.1.1", "address"=>"1.1.1.1#53", "ip details"=>{"0"=>{"name"=>"cerner.com", "address"=>" 159.140.213.205"}}}
                expect(internetTools.nslookup validURL,customDNS).to include(output)
            end
            it "program returns empty lookup for inavlid url" do
                output = {"server"=>"1.1.1.1", "address"=>"1.1.1.1#53", "ip details"=>{}}
                expect(internetTools.nslookup invalidURL,customDNS).to include(output)
            end
        end
    end
    
    context "# getIP " do
        it "program returns IP addresses" do
            allow(mock).to receive(:get_IP) {["127.0.0.1", "192.168.0.1"]}
            expect(mock.get_IP).to match(["127.0.0.1", "192.168.0.1"])
        end
    end
end