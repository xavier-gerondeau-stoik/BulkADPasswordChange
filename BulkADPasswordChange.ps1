[cmdletbinding()]
Param (
  [Parameter(Mandatory=$false,Position=0)][string]$Password,
  [Parameter(Mandatory=$false)][switch]$ChangePasswordAtLogon = $false
)

$ErrorActionPreference = "Stop"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
  Write-Warning "Not running elevated. Open PowerShell as administrator and run script again."
  Exit
}

$Global:WordList = "about,above,across,act,active,activity,add,afraid,after,again,age,ago,agree,air,all,alone,along,already,always,amount,and,angry,another,answer,any,anyone,anything,anytime,appear,apple,are,area,arm,army,around,arrive,art,ask,attack,aunt,autumn,away,baby,back,bad,bag,ball,bank,base,basket,bath,bean,bear,beautiful,bed,bedroom,beer,behave,before,begin,behind,bell,below,besides,best,better,between,big,bird,birth,birthday,bit,bite,black,bleed,block,blood,blow,blue,board,boat,body,boil,bone,book,border,born,borrow,both,bottle,bottom,bowl,box,boy,branch,brave,bread,break,breakfast,breathe,bridge,bright,bring,brother,brown,brush,build,burn,business,bus,busy,but,cake,call,can,candle,cap,car,card,care,careful,careless,carry,case,cat,catch,central,century,certain,chair,chance,change,chase,cheap,cheese,chicken,child,children,chocolate,choice,choose,circle,city,class,clever,clean,clear,climb,clock,cloth,clothes,cloud,cloudy,close,coffee,coat,coin,cold,collect,colour,comb,comfortable,common,compare,come,complete,computer,condition,continue,control,cook,cool,copper,corn,corner,correct,cost,contain,count,country,course,cover,crash,cross,cry,cup,cupboard,cut,dance,dangerous,dark,daughter,day,dead,decide,decrease,deep,deer,depend,desk,destroy,develop,die,different,difficult,dinner,direction,dirty,discover,dish,do,dog,door,double,down,draw,dream,dress,drink,drive,drop,dry,duck,dust,duty,each,ear,early,earn,earth,east,easy,eat,education,effect,egg,eight,either,electric,elephant,else,empty,end,enemy,enjoy,enough,enter,equal,entrance,escape,even,evening,event,ever,every,everyone,exact,everybody,examination,example,except,excited,exercise,expect,expensive,explain,extremely,eye,face,fact,fail,fall,false,family,famous,far,farm,father,fast,fat,fault,fear,feed,feel,female,fever,few,fight,fill,film,find,fine,finger,finish,fire,first,fish,fit,five,fix,flag,flat,float,floor,flour,flower,fly,fold,food,fool,foot,football,for,force,foreign,forest,forget,forgive,fork,form,fox,four,free,freedom,freeze,fresh,friend,friendly,from,front,fruit,full,fun,funny,furniture,further,future,game,garden,gate,general,gentleman,get,gift,give,glad,glass,go,goat,god,gold,good,goodbye,grandfather,grandmother,grass,grave,great,green,gray,ground,group,grow,gun,hair,half,hall,hammer,hand,happen,happy,hard,hat,hate,have,he,head,healthy,hear,heavy,heart,heaven,height,hello,help,hen,her,here,hers,hide,high,hill,him,his,hit,hobby,hold,hole,holiday,home,hope,horse,hospital,hot,hotel,house,how,hundred,hungry,hour,hurry,husband,hurt,ice,idea,if,important,in,increase,inside,into,introduce,invent,iron,invite,is,island,it,jelly,job,join,juice,jump,just,keep,key,kill,kind,king,kitchen,knee,knife,knock,know,ladder,lady,lamp,land,large,last,late,lately,laugh,lazy,lead,leaf,learn,leave,leg,left,lend,length,less,lesson,let,letter,library,lie,life,light,like,lion,lip,list,listen,little,live,lock,lonely,long,look,lose,lot,love,low,lower,luck,machine,main,make,male,man,many,map,mark,market,marry,matter,may,me,meal,mean,measure,meat,medicine,meet,member,mention,method,middle,milk,million,mind,minute,miss,mistake,mix,model,modern,moment,money,monkey,month,moon,more,morning,most,mother,mountain,mouth,move,much,music,must,my,name,narrow,nation,nature,near,nearly,neck,need,needle,neighbour,neither,net,never,new,news,newspaper,next,nice,night,nine,no,noble,noise,none,nor,north,nose,not,nothing,notice,now,number,obey,object,ocean,of,off,offer,office,often,oil,old,on,one,only,open,opposite,orange,order,other,our,out,outside,over,own,page,pain,paint,pair,pan,paper,parent,park,part,partner,party,pass,past,path,pay,peace,pen,pencil,people,pepper,per,perfect,period,person,petrol,photograph,piano,pick,picture,piece,pig,pin,pink,place,plane,plant,plastic,plate,play,please,pleased,plenty,pocket,point,poison,police,polite,pool,poor,popular,position,possible,potato,pour,power,present,press,pretty,prevent,price,prince,prison,private,prize,probably,problem,produce,promise,proper,protect,provide,public,pull,punish,pupil,push,put,queen,question,quick,quiet,quite,radio,rain,rainy,raise,reach,read,ready,real,really,receive,record,red,remember,remind,remove,rent,repair,repeat,reply,report,rest,restaurant,result,return,rice,rich,ride,right,ring,rise,road,rob,rock,room,round,rubber,rude,rule,ruler,run,rush,sad,safe,sail,salt,same,sand,save,say,school,science,scissors,search,seat,second,see,seem,sell,send,sentence,serve,seven,several,shade,shadow,shake,shape,share,sharp,she,sheep,sheet,shelf,shine,ship,shirt,shoe,shoot,shop,short,should,shoulder,shout,show,sick,side,signal,silence,silly,silver,similar,simple,single,since,sing,sink,sister,sit,six,size,skill,skin,skirt,sky,sleep,slip,slow,small,smell,smile,smoke,snow,so,soap,sock,soft,some,someone,something,sometimes,son,soon,sorry,sound,soup,south,space,speak,special,speed,spell,spend,spoon,sport,spread,spring,square,stamp,stand,star,start,station,stay,steal,steam,step,still,stomach,stone,stop,store,storm,story,strange,street,strong,structure,student,study,stupid,subject,substance,successful,such,sudden,sugar,suitable,summer,sun,sunny,support,sure,surprise,sweet,swim,sword,table,take,talk,tall,taste,taxi,tea,teach,team,tear,telephone,television,tell,ten,tennis,terrible,test,than,that,the,their,then,there,therefore,these,thick,thin,thing,think,third,this,though,threat,three,tidy,tie,title,to,today,toe,together,tomorrow,tonight,too,tool,tooth,top,total,touch,town,train,tram,travel,tree,trouble,true,trust,twice,try,turn,type,ugly,uncle,under,understand,unit,until,up,use,useful,usual,usually,vegetable,very,village,voice,visit,wait,wake,walk,want,warm,was,wash,waste,watch,water,way,we,weak,wear,weather,wedding,week,weight,welcome,were,well,west,wet,what,wheel,when,where,which,while,white,who,why,wide,wife,wild,will,win,wind,window,wine,winter,wire,wise,wish,with,without,woman,wonder,word,work,world,worry,yard,yell,yesterday,yet,you,young,your,zero,zoo" -split ","

$DateSuffix = "{0:yyyy-MM-dd}-{1}" -f (Get-Date), (Get-Date).Ticks

function GeneratePassword {
  Param(
    [int]$NumberOfWords = 3,
    [int]$MinimumLength = 10,
    [int]$MaximumLength = 16
  )
  do {
    $GeneratedPassword = "{0}{1}" -f `
      -join (1..$NumberOfWords | % { ((Get-Culture).TextInfo).ToTitleCase($WordList[(Get-Random $WordList.Count)]) }),
      (Get-Random 99)
  } while ($GeneratedPassword.Length -lt $MinimumLength -or $GeneratedPassword.Length -gt $MaximumLength)
  return $GeneratedPassword
}
$PasswordChangeGroup = "PasswordChange-$DateSuffix"
New-ADGroup -GroupCategory Security -GroupScope Global -Description "Temporary security group created by $($MyInvocation.MyCommand.Name)." $PasswordChangeGroup

Write-Host -NoNewline "Temporary password change group created. Press Enter to open ADUC and add users and/or groups to `"${PasswordChangeGroup}`"."
Read-Host

Start-Process "mmc.exe" "dsa.msc"

Write-Host -NoNewline "Press Enter when all required members have been added to group."
Read-Host

$PasswordChangeUsers = Get-ADGroupMember $PasswordChangeGroup -Recursive | Get-ADUser -Properties *
$Results = @()
$PasswordChangeUsers | % {
  if ($Password) {
    $NewPassword = $Password
  } else {
    $NewPassword = GeneratePassword
  }
  $Results += [PSCustomObject]@{
    "Name"               = $_.DisplayName
    "Username"           = $_.SamAccountName
    "Email"              = $_.EmailAddress
    "MobilePhone"        = $_.MobilePhone
    "Phone"              = $_.telephoneNumber
    "Office"             = $_.physicalDeliveryOfficeName
    "SID"                = ($_.SID).Value
    "Password"           = $NewPassword
  }
}

$Results | Format-Table Name, Username, Password -AutoSize
Write-Host -NoNewline "The above password changes will be made. Results will be exported to a CSV file. Continue? [N/y] "
if ((Read-Host).ToLower() -eq "y") {
  $CSVFile = Join-Path $PSScriptRoot "PasswordChange-$DateSuffix.csv"
  $Results | select Name, Username, Password, Email, MobilePhone, Phone, Office | Export-Csv -NoTypeInformation $CSVFile
  Write-Host "Results saved to `"${CSVFile}`"."

  $Results | % {
    Set-ADAccountPassword $_.SID -NewPassword (ConvertTo-SecureString -AsPlainText $_.Password -Force)
    if ($ChangePasswordAtLogon) {
      try {
      Set-ADUser $_.SID -ChangePasswordAtLogon:$true
      }
      catch {
        Write-Host "Could not set ChangePasswordAtLogon for user "${_.SID}"."
      }
    }
  }

  Write-Host "Done."
} else {
  Write-Host "Aborted."
}

Remove-ADGroup $PasswordChangeGroup -Confirm:$false
