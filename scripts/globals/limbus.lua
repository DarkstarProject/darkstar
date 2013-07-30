require("scripts/globals/keyitems");
-- require("scripts/globals/limbus");
APPOLLYON_SE_NE = 1; --out 557 -1 441 128
APPOLLYON_NW_SW = 2; --out -561 0 443 242
TEMENOS = 3;
--WHITE_CARD                      = 349;
--RED_CARD                        = 350;
--BLACK_CARD                      = 351;
--COSMOCLEANSE                    = 734;

-- REGION
NW_Apollyon =1;
SW_Apollyon =2;
NE_Apollyon =3;
SE_Apollyon =4; 
CS_Apollyon =5;
Central_Apollyon =6;

APPOLLYON_SE_NE_BCNM_LIST = { --instanceID ,white ,red ,black,bitmap,bit,instanceRegion
                        --     1292,{false,false,true,8,NE_Apollyon}, -- 'NE_Apollyon'  region 3  438 0 -89
                             1293,{false,false,true,4,SE_Apollyon}, -- 'SE_Apollyon'            468 0 -625
                       --      1294,{false,false,false,32,CS_Apollyon}, -- 'CS_Apollyon'          0   0 -210     
                        --     1295,{false,false,false,64,CS_Apollyon}, -- 'CS_Apollyon_II'       0   0 -133
                       --      1296,{false,false,false,16,Central_Apollyon}, -- 'Central_Apollyon'     0   0 210
                       --      1297,{false,false,false,128,Central_Apollyon} -- 'Central_Apollyon_II'  0   0 210
                             };

APPOLLYON_NW_SW_BCNM_LIST = {
                       --      1290,{false,true,false,2,NW_Apollyon}, -- 'NW_Apollyon'            -439  0 -89
                       --      1291,{false,true,false,1,SW_Apollyon}, -- 'SW_Apollyon'            -468  0 -626
                       --      1294,{false,false,false,32,CS_Apollyon}, -- 'CS_Apollyon'            0   0 -210      
                       --      1295,{false,false,false,64,CS_Apollyon}, -- 'CS_Apollyon_II'         0   0 -133
                       --      1296,{false,false,false,16,Central_Apollyon}, -- 'Central_Apollyon'       0   0 210
                        --     1297,{false,false,false,128,Central_Apollyon} -- 'Central_Apollyon_II'    0   0 210
                            };

TEMENOS_LIST = {
                             1298,{true,false,false,0,1}, -- 'Temenos_Western_Tower'	
                             1299,{true,false,false,0,2}, -- 'Temenos_Northern_Tower'
                             1300,{true,false,false,0,3}, -- 'Temenos_Eastern_Tower'
                             1301,{true,false,false,0,4}, -- 'Central_Temenos_Basement'
                             1302,{true,false,false,0,4}, -- 'Central_Temenos_Basement_II'
                             1303,{true,false,false,0,5}, -- 'Central_Temenos_1st_Floor'
                             1304,{true,false,false,0,6}, -- 'Central_Temenos_2nd_Floor'
                             1305,{true,false,false,0,7}, -- 'Central_Temenos_3rd_Floor'
                             1306,{false,false,false,0,8}, -- 'Central_Temenos_4th_Floor'
                             1307,{false,false,false,0,8} -- 'Central_Temenos_4th_Floor_II'
                };

				
				       -- armoryID,(type,regionID,time, despawnothercoffer, mimicID ,lootID)
		
	STATUS_NORMAL = 0;
	STATUS_DISAPPEAR = 2;
	cTIME=1
	cITEM=2
	cRESTORE=3;
	cMIMIC=4;
ARMOURY_CRATES_LIST_APPOLLYON= { 
-- appolyon list
	1	,{cTIME,SE_Apollyon,5,false,0,0}, -- time    SE_Appollyon floor 1
	2	,{cITEM,SE_Apollyon,0,false,0,110}, -- items	
	3	,{cRESTORE,SE_Apollyon,0,false,0,0}, -- restore

	14	,{cTIME,NE_Apollyon,10,false,0,0}, -- time   NE_Apollyon
	15	,{cITEM,NE_Apollyon,0,false,0,10}, -- items
	16	,{cRESTORE,NE_Apollyon,0,false,0,0}, -- restore

	32	,{}, 
	33	,{}, 
	34	,{}, 
	35	,{}, 
	36	,{}, 
	37	,{}, 
	38	,{}, 
	39	,{}, 
	40	,{}, 
	41	,{}, 
	42	,{}, 
	43	,{}, 
	44	,{}, 
	45	,{}, 

	70	,{cTIME,SW_Apollyon,10,false,0,0}, -- time   -- SW_Apollyon
	71	,{cITEM,SW_Apollyon,0,false,0,10}, -- items
	72	,{cRESTORE,SW_Apollyon,0,false,0,0}, -- restore

	81	,{}, 
	82	,{}, 
	83	,{}, 
	84	,{}, 
	85	,{}, 

	94	,{}, 
	95	,{}, 
	96	,{}, 
	97	,{}, 
	98	,{}, 

	107	,{}, 
	108	,{}, 
	109	,{}, 
	110	,{}, 
	111	,{}, 

	118	,{cTIME,NW_Apollyon,10,false,0,0}, -- time    -- NW
	119	,{cITEM,NW_Apollyon,0,false,0,10}, -- items
	120	,{cRESTORE,NW_Apollyon,0,false,0,0}, -- restore

	125	,{cTIME,CS_Apollyon,10,false,010}, -- time   -- 'CS_Apollyon'
	126	,{cITEM,CS_Apollyon,0,false,0,10}, -- items
	127	,{cRESTORE,CS_Apollyon,0,false,0,0}, -- restore

	139	,{cTIME,CS_Apollyon,10,false,0,0}, -- time  -- 'CS_Apollyon_II'
	140	,{cITEM,CS_Apollyon,0,false,0,10}, -- items
	141	,{cRESTORE,CS_Apollyon,0,false,0,0}, -- restore

	153	,{cTIME,Central_Apollyon,10,false,0,0}, -- time  -- 'Central_Apollyon' 
	154	,{cITEM,Central_Apollyon,0,false,0,10}, -- items
	155	,{cRESTORE,Central_Apollyon,0,false,0,0}, -- restore
 
	177	,{cTIME,Central_Apollyon,10,false,0,0}, -- time -- 'Central_Apollyon_II'
	178	,{cITEM,Central_Apollyon,0,false,0,10}, -- items
	179	,{cRESTORE,Central_Apollyon,0,false,0,0}, -- restore

	189	,{}, 
	190	,{}, 

	195	,{cTIME}, -- time
	196	,{cITEM}, -- items
	197	,{cRESTORE}, -- restore

	210	,{}, 
	211	,{}, 
	212	,{}, 
	213	,{}, 
	214	,{}, 
	215	,{}, 
	216	,{}, 

	232	,{cTIME,SE_Apollyon,5,false,0,0}, -- time  SE_Appollyon floor 2
	233	,{cITEM,SE_Apollyon,0,false,0,111}, -- items  SE_Appollyon floor 2
	234	,{cRESTORE,SE_Apollyon,0,false,0,0}, -- restore  SE_Appollyon floor 2

	246	,{cTIME,SE_Apollyon,10,false,0,0}, -- time  SE_Appollyon floor 3							
	247	,{cITEM,SE_Apollyon,0,false,0,112}, -- items  SE_Appollyon floor 3
	248	,{cRESTORE,SE_Apollyon,0,false,0,0}, -- restore  SE_Appollyon floor 3

	259	,{}, 				

	262	,{cTIME}, -- time       
	263	,{cITEM,SE_Apollyon,0,false,0,113}, -- items  SE_Appollyon floor 4
	264	,{cRESTORE},  -- restore

	289	,{}, 

	313	,{}, 

	327	,{}, 

--::::::::::::::::::::::::::::::::::::::::::::::::::::::::



} 				
ARMOURY_CRATES_LIST_TEMENOS={
                             
                            };				
function LimbusEntrance(player,entrance)
  switch (entrance): caseof {
       [1] = function (x)
            player:setPos(643,0.1,-600,124,0x26); -- instance entrer 600 1 -600
		end	,                -- sortiezone  637,-4,-642,642,4,-637
       [2] = function (x)			
		    player:setPos(-668,0.1,-666,209,0x26); -- instance entrer -599 0 -600
		end	,				-- sortiezone -642,-4,-642,-637,4,-637
   }	
end;			
function ResetPlayerLimbusVariable(player)
   player:setVar("characterLimbusKey",0);
   player:setVar("LimbusID",0);
end;

function GenerateLimbusKey()
  local Key = math.random(1,1000000);   
      while (IsKeyExist(Key)== true)  do
	    Key = math.random(1,1000000);
	  end 
   return Key;
end;

function HideArmouryCrates(Region,Zone)
   if(Zone == APPOLLYON_SE_NE or Zone == APPOLLYON_NW_SW)then
        for X = 1,table.getn (ARMOURY_CRATES_LIST_APPOLLYON),2 do 
           if(ARMOURY_CRATES_LIST_APPOLLYON[X+1][2] ==  Region)then
	          GetNPCByID((ARMOURY_CRATES_LIST_APPOLLYON[X])+16932864):setStatus(STATUS_DISAPPEAR);
           end
       end
  elseif(Zone == TEMENOS)then
       for X = 1,table.getn (ARMOURY_CRATES_LIST_TEMENOS),2 do  
           if(ARMOURY_CRATES_LIST_TEMENOS[X+1][2] ==  Region)then
	          GetNPCByID((ARMOURY_CRATES_LIST_TEMENOS[X])+16928768):setStatus(STATUS_DISAPPEAR);
           end
       end
  end   
end;

function IsKeyExist(Key) -- return true if Key already exist for another linbus
local H= false;
local KeyAlreadyExist = {
   		GetServerVariable("[NW_Apollyon]UniqueID"),
		GetServerVariable("[SW_Apollyon]UniqueID"),
		GetServerVariable("[NE_Apollyon]UniqueID"),
		GetServerVariable("[SE_Apollyon]UniqueID"),
		GetServerVariable("[CS_Apollyon]UniqueID"),
		GetServerVariable("[CS_Apollyon_II]UniqueID"),
		GetServerVariable("[Central_Apollyon]UniqueID"),
		GetServerVariable("[Central_Apollyon_II]UniqueID"),
		GetServerVariable("[Temenos_W_Tower]UniqueID"),
		GetServerVariable("[Temenos_N_Tower"),
		GetServerVariable("[Temenos_E_Tower]UniqueID"),
		GetServerVariable("[C_Temenos_Base]UniqueID"),
		GetServerVariable("[C_Temenos_Base_II]UniqueID"),
		GetServerVariable("[C_Temenos_1st]UniqueID"),
		GetServerVariable("[C_Temenos_2nd]UniqueID"),
		GetServerVariable("[C_Temenos_3rd]UniqueID"),
		GetServerVariable("[C_Temenos_4th]UniqueID"),	
		GetServerVariable("[C_Temenos_4th_II]UniqueID"),
                };
			for nl = 1,	table.getn (KeyAlreadyExist),1 do
			    if(KeyAlreadyExist[nl] == Key)then
			       H= true;
				   break;
			    end
			end				
	return H;
end;
function GetLimbusKeyFromInstance(instanceID)
 local Instancekey = 0;
 
     switch (instanceID): caseof {
       [1290] = function (x)
             Instancekey = GetServerVariable("[NW_Apollyon]UniqueID");
		end	,                
       [1291] = function (x)			
		    Instancekey = GetServerVariable("[NE_Apollyon]UniqueID"); 
		end	,				
       [1292] = function (x)			
		    Instancekey = GetServerVariable("[NE_Apollyon]UniqueID") ; 
		end	,
       [1293] = function (x)			
		    Instancekey = GetServerVariable("[SE_Apollyon]UniqueID"); 
		end	,
       [1294] = function (x)			
		    Instancekey = GetServerVariable("[CS_Apollyon]UniqueID"); 
		end	,
       [1295] = function (x)			
		    Instancekey = GetServerVariable("[CS_Apollyon_II]UniqueID"); 
		end	,
       [1296] = function (x)			
		    Instancekey = GetServerVariable("[Central_Apollyon]UniqueID"); 
		end	,
       [1297] = function (x)			
		    Instancekey = GetServerVariable("[Central_Apollyon_II]UniqueID"); 
		end	,
       [1298] = function (x)			
		   Instancekey = GetServerVariable("[Temenos_W_Tower]UniqueID"); 
		end	,
       [1299] = function (x)			
		   Instancekey = GetServerVariable("[Temenos_N_Tower"); 
		end	,
       [1300] = function (x)			
		   Instancekey = GetServerVariable("[Temenos_E_Tower]UniqueID"); 
		end	,
       [1301] = function (x)			
		   Instancekey = GetServerVariable("[C_Temenos_Base]UniqueID"); 
		end	,
       [1302] = function (x)			
		  Instancekey = GetServerVariable("[C_Temenos_Base_II]UniqueID"); 
		end	,
       [1303] = function (x)			
		  Instancekey = GetServerVariable("[C_Temenos_1st]UniqueID"); 
		end	,
       [1304] = function (x)			
		  Instancekey =  GetServerVariable("[C_Temenos_2nd]UniqueID"); 
		end	,
       [1305] = function (x)			
		  Instancekey = GetServerVariable("[C_Temenos_3rd]UniqueID"); 
		end	,		
	   [1306] = function (x)			
		  Instancekey = GetServerVariable("[C_Temenos_4th]UniqueID"); 
		end	,		
       [1307] = function (x)			
		  Instancekey = GetServerVariable("[C_Temenos_4th_II]UniqueID"); 
		end	,		
		  
   }	
   print("Server_;_instanceID "..instanceID.." Serverkey "..Instancekey);

    return Instancekey ;
end;


function ResetKeyForEmptyLimbus(player,instanceID)
   instancestatus=player:isSpecialIntanceEmpty(GetInstanceRegion(instanceID));
   
  -- print("instancestatus"..instancestatus);
   
 if(instancestatus==0)then
    switch (instanceID): caseof {
       [1290] = function (x)
             SetServerVariable("[NW_Apollyon]UniqueID",0);	print("[NW_Apollyon]KeyDelete");	 
		end	,                
       [1291] = function (x)			
		    SetServerVariable("[NE_Apollyon]UniqueID",0); 	print("[NE_Apollyon]KeyDelete");	
		end	,				
       [1292] = function (x)			
		    SetServerVariable("[NE_Apollyon]UniqueID",0) ; 	print("[NE_Apollyon]KeyDelete");	
		end	,
       [1293] = function (x)			
		    SetServerVariable("[SE_Apollyon]UniqueID",0); 	print("[SE_Apollyon]KeyDelete");	
		end	,
       [1294] = function (x)			
		    SetServerVariable("[CS_Apollyon]UniqueID",0); 	print("[CS_Apollyon]KeyDelete");	
		end	,
       [1295] = function (x)			
		    SetServerVariable("[CS_Apollyon_II]UniqueID",0); 	print("[CS_Apollyon_II]KeyDelete");	
		end	,
       [1296] = function (x)			
		    SetServerVariable("[Central_Apollyon]UniqueID",0); 	print("[Central_Apollyon]KeyDelete");	
		end	,
       [1297] = function (x)			
		    SetServerVariable("[Central_Apollyon_II]UniqueID",0); 	print("[Central_Apollyon_II]KeyDelete");	
		end	,
       [1298] = function (x)			
		    SetServerVariable("[Temenos_W_Tower]UniqueID",0); 	print("[Temenos_W_Tower]KeyDelete");	
		end	,
       [1299] = function (x)			
		    SetServerVariable("[Temenos_N_Tower]UniqueID",0); 	print("[Temenos_N_Tower]KeyDelete");	
		end	,
       [1300] = function (x)			
		    SetServerVariable("[Temenos_E_Tower]UniqueID",0); 	print("[Temenos_E_Tower]KeyDelete");	
		end	,
       [1301] = function (x)			
		    SetServerVariable("[C_Temenos_Base]UniqueID",0); 	print("[C_Temenos_Base]KeyDelete");	
		end	,
       [1302] = function (x)			
		    SetServerVariable("[C_Temenos_Base_II]UniqueID",0); 	print("[C_Temenos_Base_II]KeyDelete");	
		end	,
       [1303] = function (x)			
		    SetServerVariable("[C_Temenos_1st]UniqueID",0); 	print("[C_Temenos_1st]KeyDelete");	
		end	,
       [1304] = function (x)			
		    SetServerVariable("[C_Temenos_2nd]UniqueID",0); 	print("[C_Temenos_2nd]KeyDelete");	
		end	,
       [1305] = function (x)			
		    StServerVariable("[C_Temenos_3rd]UniqueID",0); 	print("[C_Temenos_3rd]KeyDelete");	
		end	,		
	   [1306] = function (x)			
		    SetServerVariable("[C_Temenos_4th]UniqueID",0); 	print("[C_Temenos_4th]KeyDelete");	
		end	,		
       [1307] = function (x)			
		    SetServerVariable("[C_Temenos_4th_II]UniqueID",0); 	print("[C_Temenos_4th_II]KeyDelete");	
		end	,			  
   }	 
  end       
end;



function GetInstanceRegion(instanceID)
  region = 0;
   for K = 1,table.getn (APPOLLYON_SE_NE_BCNM_LIST),2 do
      if( APPOLLYON_SE_NE_BCNM_LIST[K] == instanceID)then
	    region =APPOLLYON_SE_NE_BCNM_LIST[K+1][5]; 
      end
   end
   for L = 1,table.getn (APPOLLYON_NW_SW_BCNM_LIST),2 do
      if(APPOLLYON_NW_SW_BCNM_LIST[L] == instanceID)then
	    region =APPOLLYON_NW_SW_BCNM_LIST[L+1][5] ;	  
      end
   end
   for M = 1,table.getn (TEMENOS_LIST),2 do
      if(TEMENOS_LIST[M] ==  instanceID)then
	    region = TEMENOS_LIST[M+1][5];	  
      end
   end
   return region;
end;

function RegisterLimbusInstance(player,instanceID)
local playerLimbusKeyID  = player:getVar("characterLimbusKey");
local playerLimbusID  = player:getVar("LimbusID");
local inst=0;
  
  ResetKeyForEmptyLimbus(player,instanceID); -- instancekey will be reset if this instance is empty

     if(playerLimbusID == 0 )then
        playerLimbusID = instanceID;
	 end
     print("Player_:_instanceID_"..playerLimbusID.." Playerkey "..playerLimbusKeyID);
   		if(playerLimbusID~=0)then

            if(GetLimbusKeyFromInstance(playerLimbusID)==0 and playerLimbusKeyID==0)then  
               inst = player:bcnmRegister(playerLimbusID);			-- Build Limbus	
			    printf("Regionfound: %u",inst);
                if(inst == GetInstanceRegion(playerLimbusID))then                				
			          player:bcnmEnter(playerLimbusID);	
					  printf("BCNM_CREATE_WITH_REGION: %u",inst);
                else
				      player:setPos(643,0.1,-600); player:messageSpecial(7006);
					  ResetPlayerLimbusVariable(player);  
					  print("BCNM_cant_be _create");
                end				
            end	
		end 	

end;

function TryTobackOnCurrentLimbus(player)
local currentlimbus=0;
local playerLimbusID = player:getVar("LimbusID");
local playerLimbusKeyID = player:getVar("characterLimbusKey");    
	     print("Player_:_instanceID_"..playerLimbusID.." Playerkey "..playerLimbusKeyID);		
			     if( GetLimbusKeyFromInstance(playerLimbusID) == playerLimbusKeyID and player:isSpecialIntanceEmpty(GetInstanceRegion(playerLimbusID))==1 )then  -- player deco and back
				   currentlimbus=playerLimbusID;

				   print("trying_to_add_player_on_the_current_bcnm");
					local registration = player:addPlayerToSpecialInstance(playerLimbusID);
			              if(registration ~= 1)then
                                currentlimbus=0;
				          end
				 else
                   	currentlimbus=0;			 
			     end

   return currentlimbus;
end;	   



