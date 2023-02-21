fileID = fopen('data.txt','r');
Flatten = [];
FC7 = [];
FC6 = [];
labels = [];
for i=1:1002
    l_str = fgets(fileID);
    Flaten_str = fgets(fileID);
    FC7_str = fgets(fileID);
    FC6_str = fgets(fileID);
    l = str2double(l_str);
    labels = [ labels , l];
    Flatten = [Flatten; str2double(regexp(Flaten_str,' ', 'split'))];
    FC7 = [FC7; str2double(regexp(FC7_str, ' ', 'split'))];
    FC6 = [FC6; str2double(regexp(FC6_str, ' ', 'split'))];
end

fidFlatten = fopen('flatten.txt','w');

for i=1:1002
   fprintf(fidFlatten,"%f ", labels(i));
   for j=1:25088
      fprintf(fidFlatten,"%f ", Flatten(i,j));
   end
   fprintf(fidFlatten,"\n");
end

fclose(fidFlatten);

fidFC7 = fopen('FC7.txt','w');
fidFC6 = fopen('FC6.txt','w');

for i=1:1002
   fprintf(fidFC7,"%f ", labels(i));
   fprintf(fidFC6,"%f ", labels(i));
   for j=1:4096
      fprintf(fidFC7,"%f ", FC7(i,j));
      fprintf(fidFC6,"%f ", FC6(i,j));
   end
   fprintf(fidFC7,"\n");
   fprintf(fidFC6,"\n");
end

fclose(fidFC7);
fclose(fidFC6);