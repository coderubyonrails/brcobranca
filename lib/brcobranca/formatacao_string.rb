#
module Brcobranca
  # Métodos auxiliares de formatação de strings
  module FormatacaoString
    # Formata o tamanho da string
    # para o tamanho passado
    # se a string for menor, adiciona espacos a direita
    # se a string for maior, trunca para o num. de caracteres
    #
    def format_size(size)
      if self.size > size
        remove_accents.strip.gsub(/\s+/, ' ').gsub(/[^A-Za-z0-9[[:space:]]]/, '').truncate(size)
      else
        remove_accents.strip.gsub(/\s+/, ' ').gsub(/[^A-Za-z0-9[[:space:]]]/, '').ljust(size, ' ')
      end
    end

    def truncate(truncate_at)
      return dup unless length > truncate_at
      "#{self[0, truncate_at]}"
    end

    def remove_accents
      self.tr(
        "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
        "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz"
      )
    end

  end
end

[String].each do |klass|
  klass.class_eval { include Brcobranca::FormatacaoString }
end
