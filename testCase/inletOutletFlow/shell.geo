ls = 0.05;

ri = 0.25;
ro = 0.300;

nr = 5;
nt = 50; 

a = 0.5;
b = 0.5;


//+
Point(1) = {a, b, 0.05, ls};

Point(2) = {a+ri,b, 0.05, ls};
Point(3) = {a+ro, b, 0.05, ls};

Point(4) = {a, ri + b, 0.05, ls};
Point(5) = {a, b + ro, 0.05, ls};
//+
Line(1) = {2, 3};
//+
Line(2) = {4, 5};
//+
Circle(3) = {2, 1, 4};
//+
Circle(4) = {3, 1, 5};


//+
Curve Loop(1) = {4, -2, -3, 1};
//+
Plane Surface(1) = {1};

Transfinite Line {1,2} = nr;
Transfinite Line {3,4} = nt;
Transfinite Surface {1} = {2,3,5,4};

//+
Symmetry {1, 0, 0, -a} {
  Duplicata { Surface{1}; }
}
//+
Symmetry {0, 1, 0, -b} {
  Duplicata { Surface{5}; Surface{1}; }
}

// top left
Transfinite Line {2,9} = nr;
Transfinite Line {8,6} = nt;
Transfinite Surface {5} = {4,5,6,17};


// bottom left
Transfinite Line {9,12} = nr;
Transfinite Line {13,11} = nt;
Transfinite Surface {10} = {17,6,20,24};

// bottom right
Transfinite Line {12,1} = nr;
Transfinite Line {18,16} = nt;
Transfinite Surface {15} = {24,20,3,2};

//+
Physical Surface("shell") = {5, 1, 10, 15};
