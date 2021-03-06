#!/bin/sh

source $TestArea/../build/x86_64-centos7-gcc62-opt/setup.sh

echo $PWD
cp ../*.sh ./
cp ../*.py ./

Reco_tf.py --outputAODFile AOD.pool.root \
  --digiSteeringConf 'StandardSignalOnlyTruth' \
  --maxEvents 500 \
  --conditionsTag 'OFLCOND-MC16-SDR-17-Perf-01' \
  --valid 'True' \
  --postInclude 'default:PyJobTransforms/UseFrontier.py' \
  --autoConfiguration 'everything' \
  --triggerConfig 'RDOtoRDOTrigger=MCRECO:MenuName:MC_pp_v7_tight_mc_prescale' \
  --postExec 'all:CfgMgr.MessageSvc().setError+=["HepMcParticleLink"]' 'ESDtoAOD:fixedAttrib=[s if "CONTAINER_SPLITLEVEL = \"99\"" not in s else "" for s in svcMgr.AthenaPoolCnvSvc.PoolAttributes];svcMgr.AthenaPoolCnvSvc.PoolAttributes=fixedAttrib' \
  --preExec 'all:rec.Commissioning.set_Value_and_Lock(True);from AthenaCommon.BeamFlags import jobproperties;jobproperties.Beam.numberOfCollisions.set_Value_and_Lock(0.0);from LArROD.LArRODFlags import larRODFlags;larRODFlags.NumberOfCollisions.set_Value_and_Lock(0);larRODFlags.nSamples.set_Value_and_Lock(4);larRODFlags.doOFCPileupOptimization.set_Value_and_Lock(True);larRODFlags.firstSample.set_Value_and_Lock(0);larRODFlags.useHighestGainAutoCorr.set_Value_and_Lock(True)' 'all:from InDetRecExample.InDetJobProperties import InDetFlags; InDetFlags.doSlimming.set_Value_and_Lock(False)' 'all:from TriggerJobOpts.TriggerFlags import TriggerFlags;TriggerFlags.AODEDMSet.set_Value_and_Lock("AODFULL");' 'all:from JetRec.JetRecFlags import jetFlags,JetContentDetail; jetFlags.detailLevel=JetContentDetail.Full' 'RAWtoESD:rec.doFTK.set_Value_and_Lock(True)' \
  --geometryVersion 'default:ATLAS-R2-2016-01-00-00' \
  --AMITag='r9921' \
  --postInclude ../outputLevelConfig.py

rm -f tmp.ESD
rm -f core*

  #--triggerConfig 'RAWtoESD=MCRECO:DBF:TRIGGERDBMC:2172,47,200' \

#
#Reco_tf.py --outputAODFile AOD.pool.root \
#  --digiSteeringConf 'StandardSignalOnlyTruth' --skipEvents 400 --maxEvents 100 --conditionsTag 'default:OFLCOND-MC16-SDR-17' --valid 'True' --postInclude 'default:PyJobTransforms/UseFrontier.py' --autoConfiguration 'everything' --triggerConfig 'RDOtoRDOTrigger=MCRECO:MenuName:MC_pp_v7_tight_mc_prescale' --postExec 'all:CfgMgr.MessageSvc().setError+=["HepMcParticleLink"]' 'ESDtoAOD:fixedAttrib=[s if "CONTAINER_SPLITLEVEL = \"99\"" not in s else "" for s in svcMgr.AthenaPoolCnvSvc.PoolAttributes];svcMgr.AthenaPoolCnvSvc.PoolAttributes=fixedAttrib' 'RAWtoESD:topSequence.TrigSteer_HLT.enableRobRequestPreparation=False' --preExec 'all:rec.Commissioning.set_Value_and_Lock(True);from AthenaCommon.BeamFlags import jobproperties;jobproperties.Beam.numberOfCollisions.set_Value_and_Lock(20.0);from LArROD.LArRODFlags import larRODFlags;larRODFlags.NumberOfCollisions.set_Value_and_Lock(20);larRODFlags.nSamples.set_Value_and_Lock(4);larRODFlags.doOFCPileupOptimization.set_Value_and_Lock(True);larRODFlags.firstSample.set_Value_and_Lock(0);larRODFlags.useHighestGainAutoCorr.set_Value_and_Lock(True)' 'all:from InDetRecExample.InDetJobProperties import InDetFlags; InDetFlags.doSlimming.set_Value_and_Lock(False)' 'all:from TriggerJobOpts.TriggerFlags import TriggerFlags;TriggerFlags.AODEDMSet.set_Value_and_Lock("AODFULL");' 'all:from JetRec.JetRecFlags import jetFlags,JetContentDetail; jetFlags.detailLevel=JetContentDetail.Full' 'RAWtoESD:rec.doFTK.set_Value_and_Lock(True)' --geometryVersion 'default:ATLAS-R2-2016-01-00-01' --postInclude ../outputLevelConfig.py

#pathena -- trf "Reco_tf.py --maxEvents 100 --outputAODFile %OUT.AOD.pool.root --digiSteeringConf 'StandardSignalOnlyTruth' --conditionsTag 'default:OFLCOND-MC16-SDR-17' --valid 'True' --postInclude 'default:PyJobTransforms/UseFrontier.py' --autoConfiguration 'everything' --triggerConfig 'RDOtoRDOTrigger=MCRECO:MenuName:MC_pp_v7_tight_mc_prescale' --postExec 'all:CfgMgr.MessageSvc().setError+=[\"HepMcParticleLink\"]' 'ESDtoAOD:fixedAttrib=[s if \"CONTAINER_SPLITLEVEL = \"99\"\" not in s else \"\" for s in svcMgr.AthenaPoolCnvSvc.PoolAttributes];svcMgr.AthenaPoolCnvSvc.PoolAttributes=fixedAttrib' 'RAWtoESD:topSequence.TrigSteer_HLT.enableRobRequestPreparation=False' --preExec 'all:rec.Commissioning.set_Value_and_Lock(True);from AthenaCommon.BeamFlags import jobproperties;jobproperties.Beam.numberOfCollisions.set_Value_and_Lock(20.0);from LArROD.LArRODFlags import larRODFlags;larRODFlags.NumberOfCollisions.set_Value_and_Lock(20);larRODFlags.nSamples.set_Value_and_Lock(4);larRODFlags.doOFCPileupOptimization.set_Value_and_Lock(True);larRODFlags.firstSample.set_Value_and_Lock(0);larRODFlags.useHighestGainAutoCorr.set_Value_and_Lock(True)' 'all:from InDetRecExample.InDetJobProperties import InDetFlags; InDetFlags.doSlimming.set_Value_and_Lock(False)' 'all:from TriggerJobOpts.TriggerFlags import TriggerFlags;TriggerFlags.AODEDMSet.set_Value_and_Lock(\"AODFULL\");' 'all:from JetRec.JetRecFlags import jetFlags,JetContentDetail; jetFlags.detailLevel=JetContentDetail.Full' 'RAWtoESD:rec.doFTK.set_Value_and_Lock(True)' --geometryVersion 'default:ATLAS-R2-2016-01-00-01' --postInclude '../outputLevelConfig.py' "  --nEventsPerFile 100 --nEventsPerJob 100 --nFilesPerJob 1  --inDS user.yfukuhar.mc16_13TeV.300901.PGE_Jpsi_mu3p5mu3p5_prompt.RDO_FTK.201908230123_EXT0 --outDS user.yfukuhar.mc16_13TeV.300901.PGE_Jpsi_mu3p5mu3p5_prompt.AOD.201908230123_osMatch1
#--cmtConfig x86_64-slc6-gcc62-opt


