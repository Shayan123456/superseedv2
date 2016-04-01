

local apikey = 
'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjYzOTRlNGMwLTY0ZDItNDVlNS1hYmVhLTFkZDY2M2NhMTgwMyIsImlhdCI6MTQ1OTI0MDIzMSwic3ViIjoiZGV2ZWxvcGVyL2EyNTY0N2E4LWQwNjEtZDdlNi1hYjRmLWEzNGE0YTFiMzNkNiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgyLjEwMi4xMy45OCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.TTNEetGPs4X1_cEWRr1ARBjgz5sXYGjxgI0b4wirgYb2vr6S1m8fQBP8imt9rMGq7D8eafEDZVMn3QiBiSshAg' 
local function run(msg, matches)
 if matches[1]:lower() == 'clanrank' or matches[1]:lower() == 'clash' or matches[1]:lower() == 'clantag' or matches[1]:lower() == 'tag' then
  local clantag = matches[2]
  if string.match(matches[2], '^#.+$') then
     clantag = string.gsub(matches[2], '#', '')
  end
  clantag = string.upper(clantag)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer '..apikey..'" "https://api.clashofclans.com/v1/clans/%23'..clantag..'"'
  cmd = io.popen(curl)
  
  local result = cmd:read('*all')
  local jdat = json:decode(result)
if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local text = 'Clan Tag: '.. jdat.tag
     text = text..'\nClan Name: '.. jdat.name
     text = text..'\nDescription: '.. jdat.description
     text = text..'\nType: '.. jdat.type
     text = text..'\nWar Frequency: '.. jdat.warFrequency
     text = text..'\nClan Level: '.. jdat.clanLevel
     text = text..'\nLocation: '.. jdat.location.name
     text = text..'\nWar Wins: '.. jdat.warWins
     text = text..'\nwar WinStreak: '.. jdat.warWinStreak
     text = text..'\nClan Points: '.. jdat.clanPoints
     text = text..'\nRequired Trophies: '.. jdat.requiredTrophies
     text = text..'\nMembers: '.. jdat.members
     text = text..'\nFlag: '.. jdat.badgeUrls.medium
     text = text..'\n@shayan123hacker' -- اینو پاک کنی کل کد حرام میشه در ضمن ننه هرکی که اینو پاک یا عوض کنه :))
     cmd:close()
  return text
 end
 
 
 
 
 if matches[1]:lower() == 'memberrank' or matches[1]:lower() == 'clashmembers' or matches[1]:lower() == 'clanmembers' then
  local members = matches[2]
  members = string.upper(members)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer <API token>" "https://api.clashofclans.com/v1/locations/32000006/rankings/clans"'
  cmd = io.popen(curl)
  local result = cmd:read('*all')
  local jdat = json:decode(result)
  if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local leader = ""
  local R2 = ""
  local R3 = ""
  local R4 = ""
  local R5 = ""
  local items = jdat.items
  leader = 'Members Ranking: \n'
   for i = 1, #items do
   if items[i].rank == "1" then
   leader = leader.."\n1: "..items[i].name.."\nLevel: "..items[i].expLevel.."\nleague: "..items[i].league.name
   end
   if items[i].rank == "2" then
   R2 = R2.."\n2: "..items[i].name.."\nLevel: "..items[i].expLevel.."\nleague: "..items[i].league.name
  end
   if items[i].rank == "3" then
   R3 = R3.."\n3: "..items[i].name.."\nLevel: "..items[i].expLevel.."\nleague: "..items[i].league.name
  end
     if items[i].rank == "4" then
   R4 = R4.."\n2: "..items[i].name.."\nLevel: "..items[i].expLevel.."\nleague: "..items[i].league.name
  end
     if items[i].rank == "5" then
   R5 = R5.."\n2: "..items[i].name.."\nLevel: "..items[i].expLevel.."\nleague: "..items[i].league.name
   end
  end
text = leader.."\n"..R2.."\n"..R3.."\n"..R4"\n"..R5
  for i = 1, #items do
  text = text..'\n'..i..'- '..items[i].name..'\nlevel: '..items[i].expLevel.."\n"
  end
  text = text.."\n\n@shayan123hacker" -- اینو پاک کنی کل کد حرام میشه در ضمن ننه هرکی که اینو پاک یا عوض کنه :))
   cmd:close()
  return text
 end
end

return {
   patterns = {
"^[/!](clanrank) (.*)$",
"^[/!](memberrank) (.*)$",
   },
   run = run
}
