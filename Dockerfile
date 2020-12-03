FROM michaelchanwahyan/datalab:latest
LABEL maintainer "michaelchan_wahyan@yahoo.com.hk"

ENV PATH=$PATH:/festvox/festival/src/arch/festival:/festvox/festival/src/lib:/festvox/festival/src/main:/festvox/festival/src/modules/Duration:/festvox/festival/src/modules/Intonation:/festvox/festival/src/modules/Lexicon:/festvox/festival/src/modules/MultiSyn:/festvox/festival/src/modules/MultiSyn/inst_tmpl:/festvox/festival/src/modules/Text:/festvox/festival/src/modules/UniSyn:/festvox/festival/src/modules/UniSyn_diphone:/festvox/festival/src/modules/base:/festvox/festival/src/modules/clunits:/festvox/festival/src/modules/clustergen:/festvox/festival/src/modules/donovan:/festvox/festival/src/modules/hts_engine:/festvox/festival/src/modules/parser:/festvox/festival/src/modules/rxp:/festvox/speech_tools/audio:/festvox/speech_tools/base_class:/festvox/speech_tools/base_class/inst_tmpl:/festvox/speech_tools/base_class/string:/festvox/speech_tools/grammar/ngram:/festvox/speech_tools/grammar/scfg:/festvox/speech_tools/grammar/wfst:/festvox/speech_tools/intonation/tilt:/festvox/speech_tools/lib:/festvox/speech_tools/ling_class:/festvox/speech_tools/main:/festvox/speech_tools/rxp:/festvox/speech_tools/sigpr:/festvox/speech_tools/sigpr/pda:/festvox/speech_tools/sigpr/pda/srpd1PATH=$PATH:/festvox/speech_tools/siod:/festvox/speech_tools/speech_class:/festvox/speech_tools/stats:/festvox/speech_tools/stats/kalman_filter:/festvox/speech_tools/stats/wagon:/festvox/speech_tools/testsuite:/festvox/speech_tools/utils \
    LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/festvox/festival/src/arch/festival:/festvox/festival/src/lib:/festvox/festival/src/main:/festvox/festival/src/modules/Duration:/festvox/festival/src/modules/Intonation:/festvox/festival/src/modules/Lexicon:/festvox/festival/src/modules/MultiSyn:/festvox/festival/src/modules/MultiSyn/inst_tmpl:/festvox/festival/src/modules/Text:/festvox/festival/src/modules/UniSyn:/festvox/festival/src/modules/UniSyn_diphone:/festvox/festival/src/modules/base:/festvox/festival/src/modules/clunits:/festvox/festival/src/modules/clustergen:/festvox/festival/src/modules/donovan:/festvox/festival/src/modules/hts_engine:/festvox/festival/src/modules/parser:/festvox/festival/src/modules/rxp:/festvox/speech_tools/audio:/festvox/speech_tools/base_class:/festvox/speech_tools/base_class/inst_tmpl:/festvox/speech_tools/base_class/string:/festvox/speech_tools/grammar/ngram:/festvox/speech_tools/grammar/scfg:/festvox/speech_tools/grammar/wfst:/festvox/speech_tools/intonation/tilt:/festvox/speech_tools/lib:/festvox/speech_tools/ling_class:/festvox/speech_tools/main:/festvox/speech_tools/rxp:/festvox/speech_tools/sigpr:/festvox/speech_tools/sigpr/pda:/festvox/speech_tools/sigpr/pda/srpd1PATH=$PATH:/festvox/speech_tools/siod:/festvox/speech_tools/speech_class:/festvox/speech_tools/stats:/festvox/speech_tools/stats/kalman_filter:/festvox/speech_tools/stats/wagon:/festvox/speech_tools/testsuite:/festvox/speech_tools/utils \
    LIBRARY_PATH=/usr/local/lib:/usr/lib:/festvox/festival/src/arch/festival:/festvox/festival/src/lib:/festvox/festival/src/main:/festvox/festival/src/modules/Duration:/festvox/festival/src/modules/Intonation:/festvox/festival/src/modules/Lexicon:/festvox/festival/src/modules/MultiSyn:/festvox/festival/src/modules/MultiSyn/inst_tmpl:/festvox/festival/src/modules/Text:/festvox/festival/src/modules/UniSyn:/festvox/festival/src/modules/UniSyn_diphone:/festvox/festival/src/modules/base:/festvox/festival/src/modules/clunits:/festvox/festival/src/modules/clustergen:/festvox/festival/src/modules/donovan:/festvox/festival/src/modules/hts_engine:/festvox/festival/src/modules/parser:/festvox/festival/src/modules/rxp:/festvox/speech_tools/audio:/festvox/speech_tools/base_class:/festvox/speech_tools/base_class/inst_tmpl:/festvox/speech_tools/base_class/string:/festvox/speech_tools/grammar/ngram:/festvox/speech_tools/grammar/scfg:/festvox/speech_tools/grammar/wfst:/festvox/speech_tools/intonation/tilt:/festvox/speech_tools/lib:/festvox/speech_tools/ling_class:/festvox/speech_tools/main:/festvox/speech_tools/rxp:/festvox/speech_tools/sigpr:/festvox/speech_tools/sigpr/pda:/festvox/speech_tools/sigpr/pda/srpd1PATH=$PATH:/festvox/speech_tools/siod:/festvox/speech_tools/speech_class:/festvox/speech_tools/stats:/festvox/speech_tools/stats/kalman_filter:/festvox/speech_tools/stats/wagon:/festvox/speech_tools/testsuite:/festvox/speech_tools/utils

RUN apt-get -y update

RUN apt-get -y install libncurses5-dev libncursesw5-dev

# Festival US mirror page
# http://festvox.org/festival/

# Festival Speech Synthesis System System Documentation Page
# http://festvox.org/docs/manual-2.4.0/festival_toc.html
# but actually we are looking at 2.5.0

# Festival 2.5 repo page
# http://festvox.org/packed/festival/2.5/

RUN mkdir /festvox
RUN cd /festvox ; wget http://festvox.org/packed/festival/2.5/festival-2.5.0-release.tar.gz
RUN cd /festvox ; wget http://festvox.org/packed/festival/2.5/festlex_CMU.tar.gz
RUN cd /festvox ; wget http://festvox.org/packed/festival/2.5/festlex_OALD.tar.gz
RUN cd /festvox ; wget http://festvox.org/packed/festival/2.5/festlex_POSLEX.tar.gz
RUN cd /festvox ; wget http://festvox.org/packed/festival/2.5/speech_tools-2.5.0-release.tar.gz

RUN cd /festvox ;\
    tar -zxvf festival-2.5.0-release.tar.gz ;\
    tar -zxvf speech_tools-2.5.0-release.tar.gz ;\
    tar -zxvf festlex_CMU.tar.gz ;\
    tar -zxvf festlex_OALD.tar.gz ;\
    tar -zxvf festlex_POSLEX.tar.gz

RUN cd /festvox/speech_tools ;\
    ./configure ; make

RUN cd /festvox/festival ;\
    ./configure ; make

RUN mkdir /festvox/voices
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_ben_rm_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_ben_rm_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_guj_ad_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_guj_ad_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_guj_dp_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_guj_dp_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_guj_kt_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_guj_kt_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_hin_ab_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_hin_ab_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_kan_plv_cg.tar.gz ; tar -zxvf festvox_cmu_indic_kan_plv_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_mar_aup_cg.tar.gz ; tar -zxvf festvox_cmu_indic_mar_aup_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_mar_slp_cg.tar.gz ; tar -zxvf festvox_cmu_indic_mar_slp_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_pan_amp_cg.tar.gz ; tar -zxvf festvox_cmu_indic_pan_amp_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_tam_sdr_cg.tar.gz ; tar -zxvf festvox_cmu_indic_tam_sdr_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_tel_kpn_cg.tar.gz ; tar -zxvf festvox_cmu_indic_tel_kpn_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_tel_sk_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_tel_sk_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_indic_tel_ss_cg.tar.gz  ; tar -zxvf festvox_cmu_indic_tel_ss_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_aew_cg.tar.gz        ; tar -zxvf festvox_cmu_us_aew_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_ahw_cg.tar.gz        ; tar -zxvf festvox_cmu_us_ahw_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_aup_cg.tar.gz        ; tar -zxvf festvox_cmu_us_aup_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_awb_cg.tar.gz        ; tar -zxvf festvox_cmu_us_awb_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_axb_cg.tar.gz        ; tar -zxvf festvox_cmu_us_axb_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_bdl_cg.tar.gz        ; tar -zxvf festvox_cmu_us_bdl_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_clb_cg.tar.gz        ; tar -zxvf festvox_cmu_us_clb_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_eey_cg.tar.gz        ; tar -zxvf festvox_cmu_us_eey_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_fem_cg.tar.gz        ; tar -zxvf festvox_cmu_us_fem_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_gka_cg.tar.gz        ; tar -zxvf festvox_cmu_us_gka_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_jmk_cg.tar.gz        ; tar -zxvf festvox_cmu_us_jmk_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_ksp_cg.tar.gz        ; tar -zxvf festvox_cmu_us_ksp_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_ljm_cg.tar.gz        ; tar -zxvf festvox_cmu_us_ljm_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_lnh_cg.tar.gz        ; tar -zxvf festvox_cmu_us_lnh_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_rms_cg.tar.gz        ; tar -zxvf festvox_cmu_us_rms_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_rxr_cg.tar.gz        ; tar -zxvf festvox_cmu_us_rxr_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_slp_cg.tar.gz        ; tar -zxvf festvox_cmu_us_slp_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_cmu_us_slt_cg.tar.gz        ; tar -zxvf festvox_cmu_us_slt_cg.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_kallpc16k.tar.gz            ; tar -zxvf festvox_kallpc16k.tar.gz
RUN cd /festvox/voices ; wget http://festvox.org/packed/festival/2.5/voices/festvox_rablpc16k.tar.gz            ; tar -zxvf festvox_rablpc16k.tar.gz

RUN ln -s /festvox/voices/festival/lib/voices/ /festvox/festival/lib/voices

EXPOSE 1314
CMD [ "/bin/bash" ]
