

local apikey = 
'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjYzOTRlNGMwLTY0ZDItNDVlNS1hYmVhLTFkZDY2M2NhMTgwMyIsImlhdCI6MTQ1OTI0MDIzMSwic3ViIjoiZGV2ZWxvcGVyL2EyNTY0N2E4LWQwNjEtZDdlNi1hYjRmLWEzNGE0YTFiMzNkNiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgyLjEwMi4xMy45OCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.TTNEetGPs4X1_cEWRr1ARBjgz5sXYGjxgI0b4wirgYb2vr6S1m8fQBP8imt9rMGq7D8eafEDZVMn3QiBiSshAg' 
local function run(msg, matches)
 
 
 
 
 if matches[1]:lower() == 'clanrank' or matches[1]:lower() == 'clashmembers' or matches[1]:lower() == 'clanmembers' then
  local members = matches[2]
  members = string.upper(members)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer '..apikey..'" "https://api.clashofclans.com/v1/locations/'..members..'/rankings/clans"'
  cmd = io.popen(curl)
  local result = cmd:read('*all')
  local jdat = json:decode(result)
  if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local leader = ""
  local coleader = ""
      local R3 = ""
  local R4 = ""
    local R5 = ""
  local items = jdat.items
  leader = 'Clan Moderators: \n'
   for i = 1, #items do
   if items[i].rank == 1 then
   leader = leader.."\n1 Clan: "..items[i].name.."\nLevel: "..items[i].clanLevel.."\nClan Points: "..items[i].clanPoints.."\nClan Tag: "..items[i].tag.."\nLocation: "..items[i].location.name
   end
   if items[i].rank == 2 then
   coleader = coleader.."\n2 Clan: "..items[i].name.."\nLevel: "..items[i].clanLevel.."\nClan Points: "..items[i].clanPoints.."\nClan Tag: "..items[i].tag.."\nLocation: "..items[i].location.name
  end
     if items[i].rank == 3 then
   R3 = R3.."\n3 Clan: "..items[i].name.."\nLevel: "..items[i].clanLevel.."\nClan Points: "..items[i].clanPoints.."\nClan Tag: "..items[i].tag.."\nLocation: "..items[i].location.name
  end
     if items[i].rank == 4 then
   R4 = R4.."\n4 Clan: "..items[i].name.."\nLevel: "..items[i].clanLevel.."\nClan Points: "..items[i].clanPoints.."\nClan Tag: "..items[i].tag.."\nLocation: "..items[i].location.name
  end
     if items[i].rank == 5 then
   R5 = R5.."\n5 Clan: "..items[i].name.."\nLevel: "..items[i].clanLevel.."\nClan Points: "..items[i].clanPoints.."\nClan Tag: "..items[i].tag.."\nLocation: "..items[i].location.name
   end
  end
text = leader.."\n"..coleader.."\n"..R3.."\n"..R4.."\n"..R5.."\n"
  end
  text = text.."\n\n@shayan123hacker" -- اینو پاک کنی کل کد حرام میشه در ضمن ننه هرکی که اینو پاک یا عوض کنه :))
   cmd:close()
  return text
 end

return {
   patterns = {
"^[/!](clanrank) (.*)$",
   },
   run = run
}
