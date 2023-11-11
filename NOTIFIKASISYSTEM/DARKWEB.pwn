enum eDarkChat
{
	DarkIcon,
	DarkMessage[320],
	DarkSize
}
new InfoDarkChat[MAX_PLAYERS][7][eDarkChat];
new MaxPlayerDarkChat[MAX_PLAYERS];
new Text:TextDrawDarkChat[7*10];
new IndexDarkChat[MAX_PLAYERS];

function HideDarkChat(playerid)
{
	if(!IndexDarkChat[playerid]) return 1;
	--IndexDarkChat[playerid];
	MaxPlayerDarkChat[playerid]--;
	for(new i=-1;++i<10;) TextDrawHideForAll(TextDrawDarkChat[(IndexDarkChat[playerid]*10)+i]);
	return 1;
}

stock ShowDarkChat(const playerid, const string:message[])
{
	
	if(MaxPlayerDarkChat[playerid] == 4) return 1;
	if(pData[playerid][pFaction] >=1 ) return 1;
	MaxPlayerDarkChat[playerid]++;
	for(new x=-1; ++x <IndexDarkChat[playerid];)
	{
		for(new i=-1;++i<9;) TextDrawHideForAll(TextDrawDarkChat[(x*10) + i]);
		InfoDarkChat[playerid][IndexDarkChat[playerid]-x] = InfoDarkChat[playerid][(IndexDarkChat[playerid]-x)-1];
	}
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	format(InfoDarkChat[playerid][0][DarkMessage], 320, "%s", message);

	++IndexDarkChat[playerid];
	new Float:new_x=0.0;
	for(new x=-1;++x<IndexDarkChat[playerid];)
	{
		CreateDarkChat(playerid, x, x * 10, new_x);
		new_x += (InfoDarkChat[playerid][x][DarkSize]*7.25)+25.0;
	}
	SetTimerEx("HideDarkChat", 10000, false, "i", playerid);
	return 1;
}

stock CreateDarkChat(const playerid, index, i, const Float:new_x)
{
		new lines = InfoDarkChat[playerid][index][DarkSize];
		new Float:x = (lines * 10) + new_x;
		new Float:posisibaru = x-1.0;
		
		TextDrawDarkChat[++i] = TextDrawCreate(10.000, 202.000+posisibaru, "LD_SPAC:white");
		TextDrawTextSize(TextDrawDarkChat[i], 194.000, 36.000);
		TextDrawAlignment(TextDrawDarkChat[i], 1);
		TextDrawColor(TextDrawDarkChat[i], 842150655);
		TextDrawSetShadow(TextDrawDarkChat[i], 0);
		TextDrawSetOutline(TextDrawDarkChat[i], 0);
		TextDrawBackgroundColor(TextDrawDarkChat[i], 255);
		TextDrawFont(TextDrawDarkChat[i], 4);
		TextDrawSetProportional(TextDrawDarkChat[i], 1);
		TextDrawShowForAll(TextDrawDarkChat[i]);

		// TextDrawDarkChat[++i] = TextDrawCreate(10.000, 232.000+posisibaru, "LD_SPAC:white");
		// TextDrawTextSize(TextDrawDarkChat[i], 191.000, 25.000);
		// TextDrawAlignment(TextDrawDarkChat[i], 1);
		// TextDrawColor(TextDrawDarkChat[i], 512819199);
		// TextDrawSetShadow(TextDrawDarkChat[i], 0);
		// TextDrawSetOutline(TextDrawDarkChat[i], 0);
		// TextDrawBackgroundColor(TextDrawDarkChat[i], 255);
		// TextDrawFont(TextDrawDarkChat[i], 4);
		// TextDrawSetProportional(TextDrawDarkChat[i], 1);
		// TextDrawShowForAll(TextDrawDarkChat[i]);
		
		TextDrawDarkChat[++i] = TextDrawCreate(28.000, 206.000+posisibaru, " DarkWeb");
		TextDrawLetterSize(TextDrawDarkChat[i], 0.200, 0.899);
		TextDrawAlignment(TextDrawDarkChat[i], 1);
		TextDrawColor(TextDrawDarkChat[i], -1);
		TextDrawSetShadow(TextDrawDarkChat[i], 0);
		TextDrawSetOutline(TextDrawDarkChat[i], 0);
		TextDrawBackgroundColor(TextDrawDarkChat[i], 150);
		TextDrawFont(TextDrawDarkChat[i], 1);
		TextDrawSetProportional(TextDrawDarkChat[i], 1);
		TextDrawShowForAll(TextDrawDarkChat[i]);

		TextDrawDarkChat[++i] = TextDrawCreate(15.000, 202.000+posisibaru, "LD_BEAT:chit");
		TextDrawTextSize(TextDrawDarkChat[i], 14.000, 16.000);
		TextDrawAlignment(TextDrawDarkChat[i], 1);
		TextDrawColor(TextDrawDarkChat[i], -1);
		TextDrawSetShadow(TextDrawDarkChat[i], 0);
		TextDrawSetOutline(TextDrawDarkChat[i], 0);
		TextDrawBackgroundColor(TextDrawDarkChat[i], 255);
		TextDrawFont(TextDrawDarkChat[i], 4);
		TextDrawSetProportional(TextDrawDarkChat[i], 1);
		TextDrawShowForAll(TextDrawDarkChat[i]);

		TextDrawDarkChat[++i] = TextDrawCreate(15.000, 215.000+posisibaru, InfoDarkChat[playerid][index][DarkMessage]);
		TextDrawLetterSize(TextDrawDarkChat[i], 0.200, 0.899);
		TextDrawAlignment(TextDrawDarkChat[i], 1);
		TextDrawColor(TextDrawDarkChat[i], -1);
		TextDrawSetShadow(TextDrawDarkChat[i], 0);
		TextDrawSetOutline(TextDrawDarkChat[i], 0);
		TextDrawBackgroundColor(TextDrawDarkChat[i], 150);
		TextDrawFont(TextDrawDarkChat[i], 1);
		TextDrawSetProportional(TextDrawDarkChat[i], 1);
		TextDrawShowForAll(TextDrawDarkChat[i]);

		TextDrawDarkChat[++i] = TextDrawCreate(18.000, 206.000+posisibaru, "HUD:radar_modGarage");
		TextDrawTextSize(TextDrawDarkChat[i], 8.000, 8.000);
		TextDrawAlignment(TextDrawDarkChat[i], 1);
		TextDrawColor(TextDrawDarkChat[i], -1);
		TextDrawSetShadow(TextDrawDarkChat[i], 0);
		TextDrawSetOutline(TextDrawDarkChat[i], 0);
		TextDrawBackgroundColor(TextDrawDarkChat[i], 255);
		TextDrawFont(TextDrawDarkChat[i], 4);
		TextDrawSetProportional(TextDrawDarkChat[i], 1);
		TextDrawShowForAll(TextDrawDarkChat[i]);

		TextDrawDarkChat[++i] = TextDrawCreate(186.000, 205.000+posisibaru, "02:01");
		TextDrawLetterSize(TextDrawDarkChat[i], 0.140, 0.899);
		TextDrawTextSize(TextDrawDarkChat[i], -4.000, -3.000);
		TextDrawAlignment(TextDrawDarkChat[i], 1);
		TextDrawColor(TextDrawDarkChat[i], -1);
		TextDrawSetShadow(TextDrawDarkChat[i], 0);
		TextDrawSetOutline(TextDrawDarkChat[i], 0);
		TextDrawBackgroundColor(TextDrawDarkChat[i], 150);
		TextDrawFont(TextDrawDarkChat[i], 1);
		TextDrawSetProportional(TextDrawDarkChat[i], 1);
		TextDrawShowForAll(TextDrawDarkChat[i]);
		return true;
}
