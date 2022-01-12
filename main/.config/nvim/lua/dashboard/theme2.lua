local M = {}

function M.get(date)
    return {
        header = {
                [[                                                                              ]],
                [[                                    ██████                                    ]],
                [[                                ████▒▒▒▒▒▒████                                ]],
                [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
                [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
                [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
                [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
                [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
                [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
                [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
                [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
                [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
                [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
                [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
                [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
                [[                        ██      ██      ████      ████                        ]],
                [[                                                                              ]],
                [[                                                                              ]]
        },
        heading1 = { '┌── my place in society... ──┐' },
        heading2 = { '└──   Today is ' .. date .. ' ──┘' }
    }
end

return M
