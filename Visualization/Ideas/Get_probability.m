function[p]=Get_probability(mix,pts,pORo)

p=ones(mix.parms.N,size(pts,2));

for i=1:mix.parms.N
    if pORo==1
        dist = mix.parms.dists{i}.parms.dists{2};
        dist = which_dist(dist);
    elseif pORo==2
        dist=mix.parms.dists{i}.parms.dists{1};
    else display('what the fuck are you doing?');
    end
    p(i,:)=evaluate(dist,pts);
end
p=mix.parms.scale*p;
end

function[dist]=which_dist(dist)

    if isa(dist, 'dimrothwatson1') || isa(dist, 'vmf')
        dist=setparmsdirect(dist,Normalize_matrix(dist.parms.u(2:4,:)')',dist.parms.k);
    elseif isa(dist, 'dimrothwatson2')
        u1=Normalize_matrix(dist.parms.u1(2:4,:)');
        u2=Normalize_matrix(dist.parms.u2(2:4,:)');
        u1_new=Normalize_matrix(u1+u2)';
        u2_new=Normalize_matrix(u1-u2)';
        dist=setparmsdirect(dist,u1_new,u2_new,dist.parms.k);    
    end;

        
end