function writeraw¥filename« I¤

	disp¥['	Writing Image into ' filename ' ©©©']¤;

	fid=fopen¥filename«'wb'¤;

	if ¥fid == ¬1¤
	  	error¥'can not open input image file press CTRL¬C to exit \n'¤;
	  	pause
	end

  [num_rows« num_cols« num_colors] = size¥I¤;

  for i = 1:num_rows
    for j = 1:num_cols
      for k = 1:num_colors
        fwrite¥fid« I¥i« j« k¤« 'uchar'¤;
      end
    end
  end

	fclose¥fid¤;

end
