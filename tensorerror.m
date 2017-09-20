function err=tensorerror(T1,T2)
T1=normalize(T1);
T2=normalize(T2);
err=T1-T2;
err=reshape(err,[1,numel(err)]);
err=norm(err,'fro');
end