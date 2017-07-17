--[[
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
If you have any issues contact Metallic at: william@encryptedlaser.com
All logos, code and content are the copyright of Encrypted Laser Limited.
/*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
This script/addon is free for personal and community use within Garry's Mod, 
however the script/addon may not sold or reuploaded online.
If you have any issues contact Metallic at: william@encryptedlaser.com
/*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
CT.Jobs = false Set this value to true if you wish have the job name display in chat.
CT.Ranks = true Set this value to true if you wish to have the ULX Rank show in chat.

{"admin", "ADMIN", Color(0, 0, 255, 255) },

The first value NEEDS to be fully lowercase, and needs to fully match a ULX rank.
The second value is the value which displays in chat.
The third value is the colour which the tag is displayed in chat.
/*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
]]


local CT = {}

CT.Jobs = true 
CT.Ranks = true
CT.Debug = false

--To configure:
--First one, the rank in all LOWERCASE.
--Second one, the rank to appear in chat.
--Third one, the color of the rank.

CT.RanksToUse = {
	{"admin", "ADMIN", Color(0, 0, 255, 255) },
	{"superadmin", "SUPERADMIN", Color(255, 0, 0, 255) },
	{"owner", "OWNER", Color(0, 255, 0, 255) },
}

--[[
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
IGNORE BELOW
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
]]

hook.Add("OnPlayerChat", "MakeRankAppear", function(ply, text, teamOnly, alive, prefixText, color1, color2)
	if CT.Debug then
		print(string.lower(string.sub(prefixText, 2, 6)))
		print(teamOnly)
	end
	if CT.Jobs == true then
		local nickteamcolor = team.GetColor(ply:Team())
		local nickteam = team.GetName(ply:Team())
		if string.lower(string.sub(prefixText, 2, 6)) == "group" then
			if ply:Alive() then
				chat.AddText(Color(255, 0, 0, 255), "(TEAM) ", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
				return true
			else
				chat.AddText(Color(255, 0, 0, 255), "(TEAM) *DEAD* ", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
				return true
			end
		else
			if ply:IsPlayer() then
				if ply:Alive() then
					if string.lower(string.sub(prefixText, 2, 7)) == "advert" then
						chat.AddText(Color(255, 0, 0, 255), "", nickteamcolor, "[Advert] "..nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255,215,0, 255), text)
						return true
					elseif string.lower(string.sub(prefixText, 2, 3)) == "pm" then
						chat.AddText(Color(255, 0, 0, 255), "", Color(10, 150, 255, 255), "[PM] ", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					elseif string.lower(string.sub(prefixText, 2, 4)) == "ooc" then
						chat.AddText(Color(255, 0, 0, 255), "", nickteamcolor, "[OOC] "..nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					else
						chat.AddText(Color(255, 0, 0, 255), "", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					end
				elseif !ply:Alive() then
					if string.lower(string.sub(prefixText, 2, 7)) == "advert" then
						chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", Color(255,215,0, 255), "[Advert] ", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255,215,0, 255), text)
						return true
					elseif string.lower(string.sub(prefixText, 2, 3)) == "pm" then
						chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", Color(10, 150, 255, 255), "[PM] ", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					elseif string.lower(string.sub(prefixText, 2, 4)) == "ooc" then
						chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", nickteamcolor, "[OOC] "..nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					else
						chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", nickteamcolor, nickteam, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					end
				end
			end
		end
	elseif CT.Ranks == true then
		for k, v in pairs(CT.RanksToUse) do
			if string.lower(ply:GetUserGroup()) == v[1] then
				local nickrankcolor = v[3]
				local nickrankname = v[2]
				local nickteamcolor = team.GetColor(ply:Team())
				local nickteam = team.GetName(ply:Team())
				if string.lower(string.sub(prefixText, 2, 6)) == "group" then
					if ply:Alive() then
						chat.AddText(Color(255, 0, 0, 255), "(TEAM) ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					else
						chat.AddText(Color(255, 0, 0, 255), "(TEAM) *DEAD* ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
						return true
					end
				else
					if ply:IsPlayer() then
						if ply:Alive() then
							if string.lower(string.sub(prefixText, 2, 7)) == "advert" then
								chat.AddText(Color(255, 0, 0, 255), "", nickrankcolor, "[Advert] ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255,215,0, 255), text)
								return true
							elseif string.lower(string.sub(prefixText, 2, 3)) == "pm" then
								chat.AddText(Color(255, 0, 0, 255), "", Color(10, 150, 255, 255), "[PM] ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
								return true
							elseif string.lower(string.sub(prefixText, 2, 4)) == "ooc" then
								chat.AddText(Color(255, 0, 0, 255), "", nickrankcolor, "[OOC] ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
								return true
							else
								chat.AddText(Color(255, 0, 0, 255), "", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
								return true
							end
						elseif !ply:Alive() then
							if string.lower(string.sub(prefixText, 2, 7)) == "advert" then
								chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", nickrankcolor, "[Advert] ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255,215,0, 255), text)
								return true
							elseif string.lower(string.sub(prefixText, 2, 3)) == "pm" then
								chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", Color(10, 150, 255, 255), "[PM] ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
								return true
							elseif string.lower(string.sub(prefixText, 2, 4)) == "ooc" then
								chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", nickrankcolor, "[OOC] ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
								return true
							else
								chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", nickrankcolor, nickrankname, Color(50, 50, 50, 255), "| ", nickteamcolor, ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), text)
								return true
							end
						end
					end
				end
			end
		end
	end
end)