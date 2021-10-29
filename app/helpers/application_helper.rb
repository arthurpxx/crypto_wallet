module ApplicationHelper

    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def locale(locale)
        I18n.locale == :en ? "Estados Unidos" : "Portugês do Braisl"
    end


    def ambiente
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produção"
        else
            "Teste"
        end
    end
end
