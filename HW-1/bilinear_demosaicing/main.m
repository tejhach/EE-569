disp¥"Bilinear Demosaicing"¤;

NUM_ROWS = 440;
NUM_COLS = 580;
RGB = 3;
GRAY = 1;
EXTRA_ROWS = 2;
EXTRA_COLS = 2;
INPUT_IMAGE_FILENAME = "House©raw";
OUTPUT_IMAGE_FILENAME = "House_output©raw";
RED = 1;
GREEN = 2;
BLUE = 3;
I_input = readraw¥INPUT_IMAGE_FILENAME« NUM_ROWS« NUM_COLS« GRAY¤;
I_padded = padding¥I_input« EXTRA_ROWS« EXTRA_COLS¤;

I_output = zeros¥NUM_ROWS« NUM_COLS« RGB¤;

for i = 1:NUM_ROWS
  for j = 1:NUM_COLS
    i_padded = i + 1;
    j_padded = j + 1;

    prev_row = i_padded ¬ 1;
    prev_col = j_padded ¬ 1;
    next_row = i_padded + 1;
    next_col = j_padded + 1;

    current_val = I_padded¥i_padded« j_padded¤;
    horizontal_val = ¥I_padded¥i_padded« prev_col¤ + I_padded¥i_padded« next_col¤¤ / 2;
    vertical_val = ¥I_padded¥prev_row« j_padded¤ + I_padded¥next_row« j_padded¤¤ / 2;
    four_corners_val = ¥I_padded¥prev_row« prev_col¤ + I_padded¥prev_row« next_col¤ + I_padded¥next_row« prev_col¤ + I_padded¥next_row« next_col¤¤ / 4;
    cross_val = ¥I_padded¥prev_row« j_padded¤ + I_padded¥i_padded« prev_col¤ + I_padded¥i_padded« next_col¤ + I_padded¥next_row« j_padded¤¤ / 4;
    if mod¥i« 2¤ == 0
      if mod¥j« 2¤ == 0
        I_output¥i« j« RED¤ = vertical_val;
        I_output¥i« j« GREEN¤ = current_val;
        I_output¥i« j« BLUE¤ = horizontal_val;
      else
        I_output¥i« j« RED¤ = four_corners_val;
        I_output¥i« j« GREEN¤ = cross_val;
        I_output¥i« j« BLUE¤ = current_val;
      end
    else
      if mod¥j« 2¤ == 0
        I_output¥i« j« RED¤ = current_val;
        I_output¥i« j« GREEN¤ = cross_val;
        I_output¥i« j« BLUE¤ = four_corners_val;
      else
        I_output¥i« j« RED¤ = horizontal_val;
        I_output¥i« j« GREEN¤ = current_val;
        I_output¥i« j« BLUE¤ = vertical_val;
      end
    end
  end
end

writeraw¥OUTPUT_IMAGE_FILENAME« I_output¤;
