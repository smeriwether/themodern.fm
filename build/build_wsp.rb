def jd_picks_2022
  [
    [
      { pick: "Chiefs -9 vs. Jags" },
      { pick: "Titans -3 vs. Broncos" },
      { pick: "Steelers +1.5 vs. Saints" },
      { eliminator_pick: "Raiders" }
    ],
     [
      { pick: "Dolphins -4 at Bears", winner: false },
      { pick: "Vikings -3 at Commanders", "push": true },
      { pick: "Packers -3.5 at Lions", winner: false },
      { eliminator_pick: "Bengals", winner: true }
    ],
    [
      { pick: "Jags -2.5 vs. Broncos", winner: false },
      { pick: "Colts -2.5 vs. Commanders", winner: false },
      { pick: "Falcons -4 vs. Panthers", winner: false },
      { eliminator_pick: "Titans", winner: true }
    ],
    [
      { pick: "Bengals -6.5 vs. Falcons", winner: true },
      { pick: "Texans +7 at Raiders", winner: false },
      { pick: "Broncos -1 vs. Jets", winner: false },
      { eliminator_pick: 'Cowboys', winner: true }
    ],
    [
      { pick: "49ers -4.5 at Falcons", winner: false },
      { pick: "Browns -2.5 vs. Patriots", winner: false },
      { pick: "Seahawks +2.5 vs. Cardinals", winner: true },
      { eliminator_pick: 'Chargers', winner: true }
    ],
    [
      { pick: "Vikings -7.5 vs. Bears", winner: false },
      { pick: "Titans -1.5 at Commanders", winner: true },
      { pick: "49ers -6.5 at Panthers", winner: true },
      { eliminator_pick: 'Packers', winner: false }
    ],
    [
      { pick: "Vikings -3.5 at Saints", winner: false },
      { pick: "Texans +5 vs. Chargers", winner: false },
      { pick: "Jags +6.5 at Eagles", winner: false },
      { eliminator_pick: 'Giants', winner: true }
    ],
    [
      { pick: "Commanders -6.5 vs. Eagles", winner: false },
      { pick: "Vikings -6 vs. Lions", winner: false },
      { pick: "Texans +3 at Bears", "push": true },
      { eliminator_pick: 'Saints', winner: false }
    ],
    [
      { pick: "Ravens -3.5 vs. Dolphins", winner: false },
      { pick: "Steelers +2 vs. Patriots", winner: false },
      { pick: "Packers -9.5 vs. Bears", winner: true },
      { eliminator_pick: 'Lions', winner: true }
    ],
    [
      { pick: "Jags +3 at Commanders", winner: false },
      { pick: "Chiefs -6.5 at Cardinals", winner: true },
      { pick: "Panthers -1 vs. Browns", winner: false },
      { eliminator_pick: 'Dolphins', winner: true }
    ],
  ]
end

def stephen_picks_2022
  [
    [
      { pick: "Raiders -4.5 vs. Colts" },
      { pick: "Vikings +3.5 at Bills" },
      { pick: "Giants -4.5 vs. Texans" },
      { eliminator_pick: "Cowboys" }
    ],
    [
      { pick: "Seahawks +2 at Cardinals", winner: true },
      { pick: "Bucs -2.5 at Rams", winner: true },
      { pick: "Falcons +3 at Chargers", "push": true },
      { eliminator_pick: "Ravens", winner: true }
    ],
    [
      { pick: "Raiders -1 at Saints", winner: false },
      { pick: "Titans -2.5 at Texans", winner: true },
      { pick: "49ers -1.5 at Rams", winner: true },
      { eliminator_pick: "Titans", winner: true }
    ],
    [
      { pick: "Lions +6.5 at Cowboys", winner: false },
      { pick: "Browns +6.5 at Ravens", winner: true },
      { pick: "Seahawks +5 at Chargers", winner: true },
      { eliminator_pick: 'Patriots', winner: false }
    ],
    [
      { pick: "Bengals -3 at Saints", winner: true },
      { pick: "Browns -2.5 vs. Patriots", winner: false },
      { pick: "Jags +2.5 at Colts", winner: false },
      { eliminator_pick: 'Bucs', winner: false }
    ],
    [
      { pick: "Cowboys +5.5 at Rams", winner: true },
      { pick: "Falcons +10 at Bucs", winner: true },
      { pick: "Seahawks +5.5 at Saints", winner: false },
      { eliminator_pick: 'Jags', winner: false }
    ],
    [
      { pick: "Vikings -3.5 at Saints", winner: false },
      { pick: "Chiefs +1 at Bucs", winner: true },
      { pick: "Bears +3 at Giants", winner: false },
      { eliminator_pick: 'Packers', winner: true }
    ],
    [
      { pick: "Ravens -3 at Patriots", winner: true },
      { pick: "Chiefs -5.5 at Colts", winner: false },
      { pick: "Bills -5.5 at Dolphins", winner: false },
      { eliminator_pick: 'Raiders', winner: false }
    ],
    [
      { pick: "Ravens -3.5 vs. Dolphins", winner: false },
      { pick: "Bengals -7 at Cowboys", winner: false },
      { pick: "Vikings +2.5 at Eagles", winner: false },
      { eliminator_pick: 'Bengals', winner: false }
    ],
    [
      { pick: "Jags +3 at Commanders", winner: false },
      { pick: "Ravens -6.5 at Jets", winner: true },
      { pick: "Panthers -1 vs. Browns", winner: false },
      { eliminator_pick: 'Panthers', winner: false }
    ],
  ]
end

def wsp_picks_data
  [
    {
      name: "2022-2023 NFL Season",
      "weeks": jd_picks_2022.map.with_index do |week, idx|
        {
          name: "Week #{jd_picks_2022.length - idx}",
          jd: week.map do |pick|
            {
              eliminator_pick: pick[:eliminator_pick],
              pick: pick[:pick],
              winner: pick[:winner],
              push: pick[:push]
            }
          end,
          stephen: stephen_picks_2022[idx].map do |pick|
            {
              eliminator_pick: pick[:eliminator_pick],
              pick: pick[:pick],
              winner: pick[:winner],
              push: pick[:push]
            }
          end
        }
      end
    }
  ]
end
