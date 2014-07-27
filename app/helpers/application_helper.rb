module ApplicationHelper

  def monta_title
    if @title
      "#{I18n.t('geral.app_name')} - #{@title}"
    else
      I18n.t('geral.app_name') 
    end
  end

  def traduz_resultado(resultado)
    I18n.t("geral.#{resultado}")
  end

  def arredonda_nota(nota)
    ('%.1f' % nota) if nota
  end

end
