%  Kirchhoff migration and d i f f r a c t i o n . ( t u t o r i a l , slow )
%
v=2000;
data=zeros(100,100);data(50,50)=1;
dx=1;
t0=0;
dt=0.001;
modl=zeros(size(data));
nt=size(data,1);
nx=size(modl,2);
ny=size(data,2);
adj=1;

x0=0; y0=0; dy=dx ; z0=t0 ; dz=dt ; nz=nt;

for ix=1:nx
    x = x0 + dx * ( ix -1);
    for iy=1:ny
        y = y0 + dy * ( iy -1);     
        for iz=1:nz
            z = z0 + dz * ( iz -1);
            
            hs = (x-y ) / v;
            t = sqrt( z * z + hs * hs );
            it = 1 + ( t-t0 ) / dt;
            if ( it <= nt )
              if( adj == 0 )
                    data ( it , iy ) = data ( it , iy ) + modl ( iz , ix );
                else
                    modl ( iz , ix ) = modl ( iz , ix ) + data ( it , iy );
                end
            end
        end
        
    end
end