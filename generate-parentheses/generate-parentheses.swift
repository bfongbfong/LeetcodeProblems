                }
                else if lefts == n {
                    // put the opposite
                    mutatedCombo = currCombo + ")"
                    rights += 1
                    // actually can while loop here until it's full
                    i = 1
                }
                else if rights == n {
                    // put the opposite
                    mutatedCombo = currCombo + "("
                    lefts += 1
                    // actually can while loop here until it's full
                    i = 1
                }
​
                else if rights == lefts {
                    // put left
                    mutatedCombo = currCombo + "("
                    lefts += 1
                    i = 1
                } else if i == 0 {
                    mutatedCombo = currCombo + "("
                    lefts += 1
                } else if i == 1 {
                    mutatedCombo = currCombo + ")"
                    rights += 1
                }
                else {
                    break
                }
                
                allCombos.append(contentsOf: helper(mutatedCombo, lefts, rights))
                i += 1
            }
            
            return allCombos
        }
        
        let combos = helper("", 0, 0)
        answer.append(contentsOf: combos)
        
        return answer
    }
}
