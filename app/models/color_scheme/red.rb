# frozen_string_literal: true

class ColorScheme
  class Red < ColorScheme
    def list_bg_color
      "bg-red-50"
    end

    def task_bg_color
      "bg-red-100"
    end
  end
end
