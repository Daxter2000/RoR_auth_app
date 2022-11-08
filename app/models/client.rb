class Client < ApplicationRecord

    
    validates :names, :ap_pat, :presence => true

    def complete_name
        if self.ap_pat && self.ap_mat
            return self.names + ' ' + self.ap_pat + ' ' + self.ap_mat
        else 
            return self.names + ' ' + self.ap_pat
        end
    end
end
 