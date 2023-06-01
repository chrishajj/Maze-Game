clear
clc
close all
m1=ones(9,9);
m1(1,1)=0;
m1(1,2)=0;
m1(1,3)=0;
m1(1,4)=0;
m1(2,4)=0;
m1(3,4)=0;
m1(3,3)=0;
m1(4,3)=0;
m1(4,2)=0;
m1(5,2)=0;
m1(6,2)=0;
m1(6,3)=0;
m1(6,4)=0;
m1(6,5)=0;
m1(5,5)=0;
m1(4,5)=0;
m1(4,6)=0;
m1(3,6)=0;
m1(2,6)=0;
m1(2,7)=0;
m1(2,8)=0;
m1(3,8)=0;
m1(4,8)=0;
m1(5,8)=0;
m1(6,8)=0;
m1(6,7)=0;
m1(7,7)=0;
m1(8,7)=0;
m1(8,8)=0;
m1(9,8)=0;
m1(9,9)=0;
m2=ones(9,9);
m2(1,1)=5;
m2(9,9)=0;
imagesc(m2);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
hold on
i=1;
l=10;
m1;
fprintf('           Welcome to the maze game! \n You will struggle your way into a maze !\n But remember , you got 10 attempts only!\n Once you go run out of attempts you go back to the beginning!\n Good luck :)\n\n')
while(i<=9)
    j=1;
    while(j<=9)
        if(i==9&&j==9)
            break
        end
        k=input('For right enter 1 , for left enter -1 , for up enter 2 , for down -2: ');
        while(k~=1 && k~=-1 && k~=2 && k~=-2)
            k=input('Wrong entry ! \n If you want to go right enter 1 , for left enter -1 , for up enter 2 , for down -2: ');
        end
        if(k==1)
            if(j==9)
                fprintf('Cannot go east , there''s a wall\n')
            elseif(m2(i,j+1)==5)
                fprintf('Cannot go back doors already closed\n')
            else
                j=j+1;
                m2(i,j)=0;
                if(m2(i,j)~=m1(i,j))
                    m2(i,j)=1;
                    fprintf('Wrong way\n ')
                    j=j-1;
                    l=l-1;
                    fprintf('You got %g attempt(s) left!\n',l)
                    if(l==0)
                        fprintf('You lost\n')
                        break
                    end
                else
                    m2(i,j)=5;
                    fprintf('Keep going!\n')
                    imagesc(m2);
                    hold on
                    if(i==9 && j==9)
                        break
                    end
                end
            end
        elseif(k==-1)
            if(j==1)
                fprintf('Cannot go west , there''s a wall\n')
            elseif(m2(i,j-1)==5)
                fprintf('Cannot go back doors already closed\n')
            else
                j=j-1;
                m2(i,j)=0;
                if(m2(i,j)~=m1(i,j))
                    m2(i,j)=1;
                    fprintf('Wrong way\n')
                    j=j+1;
                    l=l-1;
                    fprintf('You got %g attempt(s) left!\n',l)
                    if(l==0)
                        fprintf('You lost\n')
                        break
                    end
                else
                    m2(i,j)=5;
                    fprintf('Keep going!\n')
                    imagesc(m2)
                    hold on
                end
            end
        elseif(k==2)
            if(i==1)
                fprintf('Cannot go north , there''s a wall\n')
            elseif(m2(i-1,j)==5)
                fprintf('Cannot go back doors already closed\n')
            else
                i=i-1;
                m2(i,j)=0;
                if(m2(i,j)~=m1(i,j))
                    m2(i,j)=1;
                    fprintf('Wrong way\n')
                    i=i+1;
                    l=l-1;
                    fprintf('You got %g attempt(s) left!\n',l)
                    if(l==0)
                        fprintf('You lost\n')
                        break
                    end
                else
                    m2(i,j)=5;
                    fprintf('Keep going!\n')
                    imagesc(m2)
                    hold on
                end
            end
        elseif(k==-2)
            if(i==9)
                fprintf('Cannot go south , there''s a wall\n')
            elseif(m2(i+1,j)==5)
                fprintf('Cannot go back doors already closed\n')
            else
                i=i+1;
                m2(i,j)=0;
                if(m2(i,j)~=m1(i,j))
                    m2(i,j)=1;
                    fprintf('Wrong way\n')
                    i=i-1;
                    l=l-1;
                    fprintf('You got %g attempt(s) left!\n',l)
                    if(l==0)
                        fprintf('You lost\n')
                        break
                    end
                else
                    m2(i,j)=5;
                    fprintf ('Keep going!\n')
                    imagesc(m2)
                    hold on
                end
            end
        end
    end
    i=i+1;
    if(l==0)
        fprintf('Game over!\nYou go back to the beginning!\n')
        i=1;
        j=1;
        m2=ones(9,9);
        m2(1,1)=5;
        m2(9,9)=0;
        imagesc(m2);
        l=10;
    end
end
fprintf('You have successfully escaped!')
hold off

