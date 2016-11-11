function[]=Visualization(qsphere,qpan,qcup,fsph,fpan,fcup)

clean_qsph=Delete_zeros(qsphere);
clean_qpan=Delete_zeros(qpan);
clean_qcup=Delete_zeros(qcup);

norm_qsph=Normalize_matrix([clean_qsph(:,5) clean_qsph(:,6) clean_qsph(:,7)]);
norm_qpan=Normalize_matrix([clean_qpan(:,5) clean_qpan(:,6) clean_qpan(:,7)]);
norm_qcup=Normalize_matrix([clean_qcup(:,5) clean_qcup(:,6) clean_qcup(:,7)]);

psph=Get_probability(fsph,clean_qsph);
ppan=Get_probability(fpan,clean_qpan);
pcup=Get_probability(fcup,clean_qcup);

norm_psph=Normalize_probability(psph);
norm_ppan=Normalize_probability(ppan);
norm_pcup=Normalize_probability(pcup);

visualize_sph=Reajust(norm_qsph,norm_psph);
visualize_pan=Reajust(norm_qpan,norm_ppan);
visualize_cup=Reajust(norm_qcup,norm_pcup);


[x1,y1,z1]=Organize_surface(visualize_sph,norm_psph);
surf(x1,y1,z1);
[x2,y2,z2]=Organize_surface(visualize_pan,norm_ppan);
figure();
surf(x2,y2,z2);
[x3,y3,z3]=Organize_surface(visualize_cup,norm_pcup);
figure();
surf(x3,y3,z3);

end