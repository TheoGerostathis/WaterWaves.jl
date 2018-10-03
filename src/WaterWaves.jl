module WaterWaves

using Roots

export waveNumber


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
    else
       fa(x) = dispersion_rel_evan(x,m0,h)
       dfa(x) = dispersion_rel_evan_1st_der(x,m0,h)
       ki = Roots.newton(fa, dfa,imode*pi/h);
    end
    return ki;
end

end # module
