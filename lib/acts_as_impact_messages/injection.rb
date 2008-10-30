module WebCo
  
  module ActsAs
    
    module ImpactMessages
      
      def acts_as_impact_messages
        self.around_filter WebCo::ActsAs::ImpactMessages::Filter
      end
            
    end
    
  end
  
end