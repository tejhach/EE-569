function I = readraw¥filename« num_rows« num_cols« num_colors¤

	disp¥['	Retrieving Image ' filename ' ©©©']¤;

	fid=fopen¥filename«'rb'¤;

	if ¥fid == ¬1¤
	  	error¥'can not open input image file press CTRL¬C to exit \n'¤;
	  	pause
	end

  I = zeros¥num_rows« num_cols« num_colors« 'uchar'¤;

  for i = 1:num_rows
    for j = 1:num_cols
      for k = 1:num_colors
        I¥i« j« k¤ = fread¥fid« 1« 'uchar'¤;
      end
    end
  end

	fclose¥fid¤;

end
