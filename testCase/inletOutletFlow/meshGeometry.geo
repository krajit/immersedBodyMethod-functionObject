//+
Point(1) = {-0.5, -0.5, 0, 1.0};
//+
Point(2) = {-0.5, 1.5, 0, 1.0};
//+
Point(3) = {2.5, -0.5, 0, 1.0};
//+
Point(4) = {2.5, 1.5, 0, 1.0};
//+
Line(1) = {1, 3};
//+
Line(2) = {2, 4};
//+
Line(3) = {1, 2};
//+
Line(4) = {3, 4};
//+
Curve Loop(1) = {2, -4, -1, 3};
//+
Plane Surface(1) = {1};


Transfinite Line {1,2} = 100;
Transfinite Line {3,4} = 50;

Transfinite Surface {1} = {1,2,3,4};
Recombine Surface{1};
//+
Extrude {0, 0, 0.1} {
  Surface{1}; Layers{1}; Recombine;
}
//+
Physical Surface("inlet") = {25};
//+
Physical Surface("outlet") = {17};
//+
Physical Surface("top") = {13};
//+
Physical Surface("bottom") = {21};
//+
Physical Surface("frontAndBack") = {1, 26};
//+
Physical Volume("tunnel") = {1};
