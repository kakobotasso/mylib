module ApplicationHelper

  def traduz_resultado(resultado)
    I18n.t("geral.#{resultado}")
  end

end
