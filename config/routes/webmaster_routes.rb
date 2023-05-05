module WebmasterRoutes
    def self.extended(router)
        router.instance_exec do
            namespace :webmaster do
                
            end
        end
    end
end