module WebCo
  
  module ActsAs
    
    module ImpactMessages
      
      class Filter
      
        class << self
         
          def before(controller) 
            @controller = controller
          end
          
          def after(controller)
            swear_at_the_user
          end         
        
          protected
        
          def swear_at_the_user
            if [:delete, :post, :put].include?(@controller.request.method)
              @controller.session[:swear] = true
            else
              if @controller.session[:swear]
                swear_message = IMPACT_MESSAGES[rand(IMPACT_MESSAGES.size)]
                body = @controller.response.body
                match = body.match(/(<body.*?>)/)
                position = match ? match.offset(0).last : body.size
                body.insert position, %(
                  <div style="padding: 10px 0; color: red; font-size: 18pt">
                  #{swear_message}
                  </div>
                )
                @controller.session[:swear] = false
              end
            end
          end
         
        end
        
      end
      
    end
    
  end
  
end