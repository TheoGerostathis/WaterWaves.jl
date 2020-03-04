using Roots

export waveNumber, waveNumberHunt

# Dispersion relation for water waves (propagating mode)
dispersion_rel(k,m0,h)=m0-k*tanh(k*h);

# First derivative of dispersion relation for water waves (propagating mode)
dispersio_rel_1st_der(k,m0,h)=-(m0+h*(k^2-m0^2))/k;

# Dispersion relation for water waves (evanescent modes)
dispersion_rel_evan(k,m0,h) = m0 + k*sin(k*h)/cos(k*h);

# First derivative of dispersion relation for water waves (evanescent modes)
dispersion_rel_evan_1st_der(k,m0,h) = -( m0 - h*(k*k + m0*m0) )/k;

function waveNumber(imode,m0::T,h::T) where T
    if imode==0
       f(x) = dispersion_rel(x,m0,h)
       df(x) = dispersio_rel_1st_der(x,m0,h)
       ki=Roots.newton(f, df, m0);
       #ki = Roots.find_zero(f,m0,Order0())
    else
       fa(x) = dispersion_rel_evan(x,m0,h)
       dfa(x) = dispersion_rel_evan_1st_der(x,m0,h)
       ki = Roots.newton(fa, dfa,imode*pi/h);
    end
    return ki;
end

function waveNumberHunt(m0::T,h::T) where T
   d=[0.6666666666,0.3555555555,0.1608465608,0.0632098765,0.0217540484,0.0065407983]
   y=m0*h
   temp=0.
   for i in range(1,stop=6)
      temp+=d[i]*y^i
   end
   return sqrt(y^2+y/(1+temp))/h
end
