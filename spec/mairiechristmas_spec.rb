require_relative '../lib/mairiechristmas'

# describe "gather townhall email" do
#     it "count the fucking mails and return the shit out of them" do
#         expect(get_townhall_urls).to eq (185)
#     end
# end

describe "return hash" do
    it "does it return a hash for this url" do
        expect(get_townhall_email["https://www.annuaire-des-mairies.com/95/ableiges.html"]).to eq {"ABLEIGES"=>"mairie.ableiges95@wanadoo.fr"}
    end
end
