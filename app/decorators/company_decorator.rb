class CompanyDecorator < SimpleDelegator
    def initialize(data)
        @data = data
        super
    end

    def CriadoEm
        unless @data.created_at.nil?
            @data.created_at.strftime("%d/%m/%Y")
        end
    end
    def AtualizadoEm
        unless @data.updated_at.nil?
            @data.updated_at.strftime("%d/%m/%Y")
        end        
    end
end