%% Determination of Attenuation Coefficients Lead C0-60

[Pb0032,err1] = Weighted_Mean_Counts([254 297 271 282 252 260 280 291 254 265 ...
          266 252 301 237 268 231 254 296 267 275]');
[Pb0064,err2] =  Weighted_Mean_Counts([231 278 253 269 233 248 234 246 278 283 ...
          243 238 255 251 241 240 250 221 272 263]');
[Pb0125,err3] =  Weighted_Mean_Counts([256 218 227 243 222 237 261 248 246 241 ...
          213 247 245 213 215 228 245 219 206 222]');
[Pb0250,err4] =  Weighted_Mean_Counts([199 185 173 172 184 179 192 209 213 202 ...
          202 204 198 205 179 270 191 184 190 210]');
      
counts = [Pb0032 Pb0064 Pb0125 Pb0250]./60;
thickness = 2.54*[0.032 0.064 0.125 0.250]; 
errcounts = [err1 err2 err3 err4];
thickness1 = linspace(0,0.250*2.54);

lncounts = log(counts);
p = polyfit(thickness,lncounts,1);

A = randn(50,4);
A = A.*(errcounts./counts) + lncounts;

p = zeros(50,2);

for i = 1:length(A);
    p(i,:) = polyfit(thickness,A(i,:),1);
    hold on
    plot(thickness1,polyval(p(i,:),thickness1),'-');
    errorbar(thickness,lncounts,errcounts./counts,'vertical','o')
end

%% Aluminum Co-60

[Al0125,err1] = Weighted_Mean_Counts([229 253 260 261 237 241 262 264 251 251 ...
                                      250 269 239 228 249 232 269 247 235 262]');
[Al0100,err2] = Weighted_Mean_Counts([267 269 253 289 233 247 261 239 243 257 ...
                                      245 268 285 279 249 259 243 270 269 246]');
[Al0090,err3] = Weighted_Mean_Counts([255 246 249 252 253 241 235 257 262 234 ...
                                      268 252 256 260 267 248 273 285 241 272]');
[Al0080,err4] = Weighted_Mean_Counts([244 254 280 248 232 266 260 273 260 281 ...
                                      246 262 249 246 274 262 291 239 250 310]');
[Al0063,err5] = Weighted_Mean_Counts([245 255 234 267 250 260 263 250 302 279 ...
                                      251 256 235 280 262 279 277 283 245 291]');
[Al0050,err6] = Weighted_Mean_Counts([288 251 256 258 258 252 292 251 261 270 ...
                                      240 272 247 263 259 263 269 272 259 243]');
[Al0040,err7] = Weighted_Mean_Counts([283 252 285 251 262 271 283 276 251 278 ...
                                      302 231 274 275 244 274 287 271 286 262]');
[Al0032,err8] = Weighted_Mean_Counts([243 272 267 263 256 278 259 239 284 264 ...
                                      273 267 278 248 285 241 272 276 271 248]');
[Al0025,err9] = Weighted_Mean_Counts([267 289 286 267 245 280 267 274 261 251 ...
                                      267 289 245 269 282 255 259 302 267 246]');
[Al0020,err10] = Weighted_Mean_Counts([276 269 240 259 280 306 273 269 265 262 ...
                                       290 249 260 237 266 268 267 273 231 285]');

counts = [Al0020 Al0025 Al0032 Al0040 Al0050 Al0063 Al0080 Al0090 Al0100 Al0125]./60;
errcounts = [err10 err9 err8 err7 err6 err5 err4 err3 err2 err1];
thickness = [0.020 0.0250 0.032 0.040 0.050 0.063 0.080 0.090 0.100 0.125]*2.54; % centimeters
thickness1 = linspace(0,0.250*2.54);
lncounts = log(counts);

lncounts = log(counts);
p = polyfit(thickness,lncounts,1);

A = randn(1000,10);
A = A.*(errcounts./counts) + lncounts;

p = zeros(1000,2);

for i = 1:length(A);
    p(i,:) = polyfit(thickness,A(i,:),1);
    hold on
    plot(thickness1,polyval(p(i,:),thickness1),'-');
    errorbar(thickness,lncounts,errcounts./counts,'vertical','o')
end

%% Lead Cs-137

[Pb0032,err1] = Weighted_Mean_Counts([87 106 106 108 104 100 98 102 100 104 ...
                                      100 88 111 96 97]');
[Pb0064,err2] =  Weighted_Mean_Counts([109 100 100 81 103 84 100 100 93 82 ...
                                       101 88 101 83 78]');
[Pb0125,err3] =  Weighted_Mean_Counts([88 106 87 84 105 82 65 88 96 77 ...
                                       91 81 82 99]');
[Pb0250,err4] =  Weighted_Mean_Counts([74 84 88 95 87 69 82 82 61 87 ...
                                       75 67 86 90 72]');

counts = [Pb0032 Pb0064 Pb0125 Pb0250]./60;
thickness = 2.54*[0.032 0.064 0.125 0.250]; 
errcounts = [err1 err2 err3 err4];
thickness1 = linspace(0,0.250*2.54);

lncounts = log(counts);
p = polyfit(thickness,lncounts,1);

A = randn(1000,4);
A = A.*(errcounts./counts) + lncounts;

p = zeros(1000,2);

for i = 1:length(A);
    p(i,:) = polyfit(thickness,A(i,:),1);
    hold on
    plot(thickness1,polyval(p(i,:),thickness1),'-');
    errorbar(thickness,lncounts,errcounts./counts,'vertical','o')
end

%% Aluminum Cs-137

[Al0125,err1] = Weighted_Mean_Counts([90 78 99 95 83 105 95 100 105 102 94 100 98 93 97]');
[Al0100,err2] = Weighted_Mean_Counts([84 81 89 91 87 102 84 84 86 106 93 82 94 86 94]');
[Al0090,err3] = Weighted_Mean_Counts([91 88 84 91 81 102 93 92 91 103 88 88 86 89 97]');
[Al0080,err4] = Weighted_Mean_Counts([91 88 84 91 81 102 93 92 91 103 88 88 86 89 97]');
[Al0063,err5] = Weighted_Mean_Counts([83 101 91 88 92 83 103 92 91 86 92 91 118 95 100]');
[Al0050,err6] = Weighted_Mean_Counts([66 98 95 98 87 76 103 65 81 90 101 98 90 97 102]');
[Al0040,err7] = Weighted_Mean_Counts([102 95 118 94 114 88 95 88 103 94 94 103 96 102 110]');
[Al0032,err8] = Weighted_Mean_Counts([84 80 97 94 94 93 98 97 88 90 97 88 83 91 94]');
[Al0025,err9] = Weighted_Mean_Counts([104 109 95 110 92 90 106 110 91 107 88 100 110 84 93]');
[Al0020,err10] = Weighted_Mean_Counts([126 117 129 142 136 133 126 125 146 122 134 135 148 140 143]');

counts = [Al0020 Al0025 Al0032 Al0040 Al0050 Al0063 Al0080 Al0090 Al0100 Al0125]./60;
errcounts = [err10 err9 err8 err7 err6 err5 err4 err3 err2 err1];
thickness = [0.020 0.0250 0.032 0.040 0.050 0.063 0.080 0.090 0.100 0.125]*2.54; % centimeters
thickness1 = linspace(0,0.250*2.54);
lncounts = log(counts);

lncounts = log(counts);
p = polyfit(thickness,lncounts,1);

A = randn(1000,10);
A = A.*(errcounts./counts) + lncounts;

p = zeros(1000,2);

for i = 1:length(A);
    p(i,:) = polyfit(thickness,A(i,:),1);
    hold on
    plot(thickness1,polyval(p(i,:),thickness1),'-');
    errorbar(thickness,lncounts,errcounts./counts,'vertical','o')
end
