function[sphere,qsphere,pan,qpan,cup,qcup]=get_Info()
%with this function we find the data about the "good" grasps from the
%complete data which was made from the graspability map
load All_Points_Cup
load All_Points_Pan
load All_Points_Sphere

size_sphere=size(All_Points_Sphere,1);
size_Cup=size(All_Points_Cup,1);
size_Pan=size(All_Points_Pan,1);

k=1;
for i=1:size_sphere%take the points for the sphere
    if All_Points_Sphere(i,15)>0.7%if the quality criteria for grasping is above 0.7 the point is considered good and we use it
        sphere(k,:)=[All_Points_Sphere(i,1) All_Points_Sphere(i,2) All_Points_Sphere(i,3) All_Points_Sphere(i,10) All_Points_Sphere(i,11) All_Points_Sphere(i,12)  All_Points_Sphere(i,16)  All_Points_Sphere(i,17)  All_Points_Sphere(i,18)];
        xrot=deg2rad(sphere(k,4));
        yrot=deg2rad(sphere(k,5));
        zrot=deg2rad(sphere(k,6));
        q=angle2quat(xrot,yrot,zrot,'xyz');
        qsphere(k,:)=[sphere(k,1:3) q];
        k=k+1;
    end
end

k=1;

for i=1:size_Pan%take the points for the pan
    if All_Points_Pan(i,15)>0.7
        pan(k,:)=[All_Points_Pan(i,1) All_Points_Pan(i,2) All_Points_Pan(i,3) All_Points_Pan(i,10) All_Points_Pan(i,11) All_Points_Pan(i,12)  All_Points_Pan(i,16)  All_Points_Pan(i,17)  All_Points_Pan(i,18)];
        xrot=deg2rad(pan(k,4));
        yrot=deg2rad(pan(k,5));
        zrot=deg2rad(pan(k,6));
        q=angle2quat(xrot,yrot,zrot,'xyz');
        qpan(k,:)=[pan(k,1:3) q];
        k=k+1;

    end
end

k=1;

for i=1:size_Cup%take the points for the cup
    if All_Points_Cup(i,15)>0.7
        cup(k,:)=[All_Points_Cup(i,1) All_Points_Cup(i,2) All_Points_Cup(i,3) All_Points_Cup(i,10) All_Points_Cup(i,11) All_Points_Cup(i,12) All_Points_Cup(i,16) All_Points_Cup(i,17) All_Points_Cup(i,18)];
        xrot=deg2rad(cup(k,4));
        yrot=deg2rad(cup(k,5));
        zrot=deg2rad(cup(k,6));
        q=angle2quat(xrot,yrot,zrot,'xyz');
        qcup(k,:)=[cup(k,1:3) q];
        k=k+1;
        if k>74
           display(k);
        end
    end
end

end
