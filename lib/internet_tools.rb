require 'socket'

# InternetTools class contains different internet tools.
class InternetTools
    # This method returns hash containing dns lookup for a given url.
    #   
    # ====Params:
    #     url (string) : URL fir which dns search is required
    #     customDNS (string) (optional) : Custom DNS, if query needs to be done from custome dns
    #
    # ====Returns:
    #     [Hash] :  A hash containing lookup data is returned. Hash structure is as follows
    #         1. First Key is 'server' which returns the DNS server which is being contacted.
    #         2. Second Key is 'address' which returns the DNS server's physical address.
    #         3. A hash containing DNS lookup index number wise.
    
    def nslookup(url, customDNS="")
        query = "nslookup #{url} #{customDNS}"
        result = IO.popen(query).read().gsub("\t","").split("\n")
        output = {}
        output["server"] = result[0].split(":")[1]
        output["address"] = result[1].split(":")[1]
        # Finding start of addresses
        output["ip details"] = {}
        ip_index = 0
        for ind in 2...result.length do
            if result[ind].start_with?("Name") == true
                ip_data = {}
                ip_data["name"] = result[ind].split(":")[1]
                ip_data["address"] = result[ind+1].split(":")[1..].join(":")
                output["ip details"][ip_index.to_s] = ip_data
                ip_index+=1
            end
        end
        output
    end

    # This method returns all the IP addresses related to machine
    # ====Returns
    #   [Array] - This method returns a list of IP address as string.
    def get_IP
        ip_list = []
        Socket.ip_address_list.each do |address|
            ip_list.push(address.ip_address)
        end
        ip_list
    end
end
