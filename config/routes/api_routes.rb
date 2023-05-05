module ApiRoutes
    def self.extended(router)
        router.instance_exec do
            namespace :api do
                
            end
        end
    end
end