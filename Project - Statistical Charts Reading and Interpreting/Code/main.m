I = imread('1.png');
%txt = ocr(I);
%disp(txt);
%disp(txt.Text(3));

%figure, imshow(I);
%[J,rect] = imcrop(I);
%figure, imshow(J);
%txt = ocr(J);
%newStr = split(txt.Text);
%disp(txt);
d=255-I;
d=I;
for row=1:size(I,1)
    for col=1:size(I,2)
        d(row,col,:)=255-I(row,col,:);
    end
end
figure, imshow(d);
txt = ocr(d , [1,2,3,4]);
[d,rect] = imcrop(d);

d = imresize(d, 3);
%d = im2bw(d);

se = strel('square', 7);
%se = strel('square', 3);
%d = imdilate(d, se);
q = imerode(d, se);
q = imdilate(q, se);
x = abs(d-q);

c = 1;
arr = [];
%for i = 1:size(I, 1) %rows
 %   for j = 1:size(I, 2) %columns
  %      pixel = I(i,j);
   %     disp(pixel);
    %    if pixel > 0
              
     %   arr(c) = pixel;
      %  c = c + 1;
        
       % i= i + 10;
        %j = j + 10;
        %end
    %end
%end
%d = imclose(d, se);
%d = imsharpen(d);
disp(arr)
figure, imshow(d);
figure, imshow(q);

figure, imshow(x);
txt = ocr(x);
newStr = split(txt.Text);
disp(newStr);

