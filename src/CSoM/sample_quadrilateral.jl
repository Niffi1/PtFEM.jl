function sample!(element::Quadrilateral, s::Matrix{Float64} , wt::Vector{Float64})
  #
  # This subroutine returns the local coordinates and weighting coefficients
  # of the integrating points.
  #
  
  const root3 = 1.0 / sqrt(3.0)
  const r15 = 0.2 * sqrt(15.0)
  nip = size(s,1)

  const w = [5.0/9.0, 8.0/9.0, 5.0/9.0]
  const v = [5.0/9.0*w; 8.0/9.0*w; 5.0/9.0*w]
 
  if nip == 1
    s[1,1] = 0.0
    s[1,2] = 0.0
    wt[1]  = 4.0
  elseif nip == 4
    s[1,1] = -root3
    s[1,2] = root3
    s[2,1] = root3
    s[2,2] = root3
    s[3,1] = -root3
    s[3,2] = -root3
    s[4,1] = root3
    s[4,2] = -root3
    wt = ones(wt)
  elseif nip == 9
    s[1:3:7,1] = -r15
    s[2:3:8,2] = 0.0
    s[3:3:9,1] = r15
    s[1:3,2]   = r15
    s[4:6,2]   = 0.0
    s[7:9,2]   = -r15
    wt = v
  elseif nip == 16
    s[1:4:13,1] = -0.861136311594053
    s[2:4:14,1] = -0.339981043584856
    s[3:4:15,1] = 0.339981043584856
    s[4:4:16,1] = 0.861136311594053
    s[1:4,2]    = 0.861136311594053
    s[5:8,2]    = 0.339981043584856
    s[9:12,2]   = -0.339981043584856
    s[13:16,2]  = -0.861136311594053
    wt[1]       = 0.121002993285602
    wt[4]       = wt[1]
    wt[13]      = wt[1]
    wt[16]      = wt[1]
    wt[2]       = 0.226851851851852
    wt[3]       = wt[2]
    wt[5]       = wt[2]
    wt[8]       = wt[2]
    wt[9]       = wt[2]
    wt[12]      = wt[2]
    wt[14]      = wt[2]
    wt[15]      = wt[2]
    wt[6]       = 0.425293303010694
    wt[7]       = wt[6]
    wt[10]      = wt[6]
    wt[11]      = wt[6]
  elseif nip == 25
    s[1:5:21,1] = 0.906179845938664
    s[2:5:22,1] = 0.538469310105683
    s[3:5:23,1] = 0.0
    s[4:5:24,1] = -0.538469310105683
    s[5:5:25,1] = -0.906179845938664
    s[ 1: 5,2]  = 0.906179845938664
    s[ 6:10,2]  = 0.538469310105683
    s[11:15,2]  = 0.0
    s[16:20,2]  = -0.538469310105683
    s[21:25,2]  = -0.906179845938664
    wt[1]  = 0.056134348862429
    wt[2]  = 0.113400000000000
    wt[3]  = 0.134785072387521
    wt[4]  = 0.113400000000000
    wt[5]  = 0.056134348862429
    wt[6]  = 0.113400000000000
    wt[7]  = 0.229085404223991
    wt[8]  = 0.272286532550750
    wt[9]  = 0.229085404223991
    wt[10] = 0.113400000000000
    wt[11] = 0.134785072387521
    wt[12] = 0.272286532550750
    wt[13] = 0.323634567901235
    wt[14] = 0.272286532550750
    wt[15] = 0.134785072387521
    wt[16] = 0.113400000000000
    wt[17] = 0.229085404223991
    wt[18] = 0.272286532550750
    wt[19] = 0.229085404223991
    wt[20] = 0.113400000000000
    wt[21] = 0.056134348862429
    wt[22] = 0.113400000000000
    wt[23] = 0.134785072387521
    wt[24] = 0.113400000000000
    wt[25] = 0.056134348862429
  else
    println("Wrong number of integrating points for a quadrilateral.")
  end
end
