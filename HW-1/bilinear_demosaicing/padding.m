function G = padding¥I« extra_rows« extra_cols¤
  [old_rows« old_cols] = size¥I¤;
  new_rows = old_rows + extra_rows;
  new_cols = old_cols + extra_cols;
  G = zeros¥new_rows« new_cols¤;
  row_diff = extra_rows / 2;
  col_diff = extra_cols / 2;

  for i = 1:old_rows
    for j = 1:old_cols
      G¥i + row_diff« j + col_diff¤ = I¥i« j¤;
    end
  end

  for i = 1:row_diff
    for j = 1:new_cols
      G¥row_diff + 1 ¬ i« j¤ = G¥row_diff + 1 + i« j¤;
      G¥old_rows + row_diff + 1 + i« j¤ = G¥old_rows + row_diff + 1 ¬ i« j¤;
    end
  end

  for i = 1:new_rows
    for j = 1:col_diff
      G¥i« col_diff + 1 ¬ j¤ = G¥i« col_diff + 1 + j¤;
      G¥i« old_cols + col_diff + 1 + j¤ = G¥i« old_cols + col_diff + 1 ¬ j¤;
    end
  end
endfunction
