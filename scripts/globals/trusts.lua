require("scripts/globals/status")
require("scripts/globals/msg")

-----------------------------------
--
--  TRUST ID
--
-----------------------------------
dsp = dsp or {}
dsp.trust = dsp.trust or {}

-----------------------------------
--  Trust
-----------------------------------
dsp.trust =
{
	SHANTOTTO           =  896;
	NAJI                =  897;
	KUPIPI              =  898;
	EXCENMILLE			=  899;
	AYAME               =  900;
	NANAA_MIHGO         =  901;
	CURILLA             =  902;
	VOLKER              =  903;
	AJIDO_MARUJIDO      =  904;
	TRION               =  905;
	ZEID                =  906;
	LION                =  907;
	TENZEN              =  908;
	MIHLI_ALIAPOH       =  909;
	VALAINERAL          =  910;
	JOACHIM             =  911;
	NAJA_SALAHEEM       =  912;
	PRISHE              =  913;
	ULMIA               =  914;
	SHIKAREE_Z          =  915;
	CHERUKIKI           =  916;
	IRON_EATER          =  917;
	GESSHO              =  918;
	GADALAR             =  919;
	RAINEMARD           =  920;
	INGRID              =  921;
	LEHKO_HABHOKA       =  922;
	NASHMEIRA           =  923;
	ZAZARG              =  924;
	OVJANG              =  925;
	MNEJING             =  926;
	SAKURA              =  927;
	LUZAF               =  928;
	NAJELITH            =  929;
	ALDO                =  930;
	MOOGLE              =  931;
	FABLINIX            =  932;
	MAAT                =  933;
	D_SHANTOTTO         =  934;
	STAR_SIBYL          =  935;
	KARAHA_BARUHA       =  936;
	CID                 =  937;
	GILGAMESH           =  938;
	AREUHAT             =  939;
	SEMIH_LAFIHNA       =  940;
	ELIVIRA             =  941;
	NOILLURIE           =  942;
	LHU_MHAKARACCA      =  943;
	FERREOUS_COFFIN     =  944;
	LILISETTE           =  945;
	MUMOR               =  946;
	UKA_TOTLIHN         =  947;
	KLARA               =  948;
	ROMAA_MIHGO         =  949;
	KUYIN_HATHDENNA     =  950;
	RAHAL               =  951;
	KORU_MORU           =  952;
	PIEUJE_UC           =  953;
	I_SHIELD_UC         =  954;
	APURURU_UC          =  955;
	JAKOH_UC            =  956;
	FLAVIRIA_UC         =  957;
	BABBAN              =  958;
	ABENZIO             =  959;
	RUGHADJEEN          =  960;
	KUKKI_CHEBUKKI      =  961;
	MARGRET             =  962;
	CHACHAROON          =  963;
	LHE_LHANGAVO        =  964;
	ARCIELA             =  965;
	MAYAKOV             =  966;
	QULTADA             =  967;
	ADELHELD            =  968;
	AMCHUCHU            =  969;
	BRYGID              =  970;
	MILDAURION          =  971;
	HALVER              =  972;
	RONGELOUTS          =  973;
	LEONOYNE            =  974;
	MAXIMILIAN          =  975;
	KAYEEL_PAYEEL       =  976;
	ROBEL_AKBEL         =  977;
	KUPOFRIED           =  978;
	SELH_TEUS           =  979;
	YORAN_ORAN_UC       =  980;
	SYLVIE_UC           =  981;
	ABQUHBAH            =  982;
	BALAMOR             =  983;
	AUGUST              =  984;
	ROSULATIA           =  985;
	TEODOR              =  986;
	ULLEGORE            =  987;
	MAKKI_CHEBUKKI      =  988;
	KING_OF_HEARTS      =  989;
	MORIMAR             =  990;
	DARRCUILN           =  991;
	AAHM                =  992;
	AAEV                =  993;
	AAMR                =  994;
	AATT                =  995;
	AAGK                =  996;
	IROHA               =  997;
	YGNAS               =  998;
	UNASSIGNED          =  999;
	UNASSIGNED          = 1000;
	UNASSIGNED          = 1001;
	UNASSIGNED          = 1002;
	CORNELIA            = 1003;
	EXCENMILLE_S        = 1004;
	AYAME_UC            = 1005;
	MAAT_UC             = 1006;
	ALDO_UC             = 1007;
	NAJA_UC             = 1008;
	LION_II             = 1009;
	ZEID_II             = 1010;
	PRISHE_II           = 1011;
	NASHMERIRA_II       = 1012;
	LILISETTE_II        = 1013;
	TENZEN_II           = 1014;
	MUMOR_II            = 1015;
	INGRID_II           = 1016;
	ARCIELA_II          = 1017;
	IROHA_II            = 1018;
	SHANTOTTO_II        = 1019;
}

function SendPartyMessage(trust, msg)
	trust:PrintToArea(msg, dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());	
end;

function getLevelDif(trust, target)
	return trust:getMainLvl() - target:getMainLvl()
end;

--function orderDamageSpells(damageSpells, order)
	--local newArray
	--for i, spell in ipairs(damageSpells) do
	--end
	--return newArray
--end