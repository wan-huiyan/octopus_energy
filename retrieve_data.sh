cd ~/Documents/octopus_energy

curl -u "sk_live_a1cQCGjQlvbQCOsLcRCVrimn:" "https://api.octopus.energy/v1/electricity-meter-points/2700003645222/meters/19L2761452/consumption/" &>> consumption.json

curl -u "sk_live_a1cQCGjQlvbQCOsLcRCVrimn:" "https://api.octopus.energy/v1/products/AGILE-18-02-21/electricity-tariffs/E-1R-AGILE-18-02-21-H/standard-unit-rates/" &>> unit_rate.json

R-f parse_return.R