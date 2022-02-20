%    D1  D2  D3  D4  D5  D6 
% S1  X   X   X   X         
% S2      X       X       X 
% S3  X       X   X       X 
% S4          X   X         
% S5              X       X  
% S6  X           X   X   X 
%


inc(s1, d1). inc(s1, d2). inc(s1, d3). inc(s1, d4).
             inc(s2, d2).              inc(s2, d4).              inc(s2, d6).
inc(s3, d1).              inc(s3, d3). inc(s3, d4).              inc(s3, d6).
                          inc(s4, d3). inc(s4, d4).
                                       inc(s5, d4).              inc(s5, d6).
inc(s6, d1).                           inc(s6, d4). inc(s6, d5). inc(s6, d6).