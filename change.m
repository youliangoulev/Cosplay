function change(fileg)
            fileid=fopen(fileg,'r');
            wggg = textscan(fileid,'%s' );
            wgg = wggg{1,1};
            db=[];
            fclose(fileid);
            fileid1=fopen([fileg(1:end-4) '(1).csy'],'w');
            for i =1:length(wgg)
                db=[db wgg{i} '\\n'];
            end
            fprintf(fileid1,['[']);
            i=1:100:length(db)-99;
            for j=i
                if (db(j+98)~='\')&&(db(j+99)=='\')
                b=j+98;
                else
                b=j+99;
                end
                if (db(j)=='\')&&(db(j+1)=='n')
                jj=j-1;
                else
                jj=j;
                end
                fprintf(fileid1,['''' db(jj:b) '''...'  '\n' ]);
            end
            if b<length(db)
                if (db(b+1)=='\')&&(db(b+2)=='n')
                b=b-1;
                end
                fprintf(fileid1,['''' db(b+1:end) ''']']);
            else
                fprintf(fileid1,[']']);
            end
            fclose(fileid1);
end

