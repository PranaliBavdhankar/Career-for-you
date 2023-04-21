from django.urls import path
from . import views

urlpatterns = [
    
      path('', views.gethome),
        path('login/', views.get_user_login, name='login'),
        path('register/', views.get_user_signup, name='signup'),
        path('do_register/', views.register_user),
        path('do_login/', views.login_user),
        path('do_logout/', views.logout_user,name='logout'),
        path('do_logout/', views.logout_user),
        path('quest/', views.get_quest,name='quest'),
        path('handle_quest/', views.handle_quest),
        path('report/', views.get_report,name='report'),
        path('success/', views.get_success,name='success'),
        path('dashboard/', views.get_dashboard,name='dashboard'),
        path('index/', views.get_home, name='index'),
        path('userProfile/', views.get_user_profile,name='userprofile'),
        path('assesment/', views.get_assesment,name='assesment'),
        path('quiz/', views.get_user_quiz,name='quiz'),
        path('saveResponse/', views.saveResponse,name='saveResponse'),
        path('pdf/', views.get_pdf,name='pdf'),
        path('updateUserProfile/', views.update_profile_page,name='updateProfilePage'),
        path('update_profile/', views.update_profile),
        path('about/', views.get_about_us, name='about'),
        path('multiple_intelligence/', views.get_multiple_intelligence_page, name='multipleIntelligence'),
        path('musical_intelligence/',views.get_musical_intelligence_page, name='musicalIntelligence'),
        path('logical_intelligence/',views.get_logical_intelligence_page, name='logicalIntelligence'),
        path('linguistic_intelligence/',views.get_linguistic_intelligence_page, name='linguisticIntelligence'),
        path('intraPersonal_intelligence/',views.get_intraPersonal_intelligence_page, name='intraPersonalIntelligence'),
        path('interPersonal_intelligence/',views.get_interPersonal_intelligence_page, name='interPersonalIntelligence'),
        path('kinesthetic_intelligence/',views.get_kinesthetic_intelligence_page, name='kinestheticlIntelligence'),
        path('visual_intelligence/',views.get_visual_intelligence_page, name='visuallIntelligence'),
        path('naturalistic_intelligence/',views.get_naturalistic_intelligence_page, name='naturalisticlIntelligence'),
        path('Career_wiki/',views.get_career_wiki_main_page, name='careerWiki'),
        path('allied_medical_science/',views.get_allied_medical_science_page, name='alliedMedicalScience'),
        path('food_and_agri/',views.get_food_add_agri_page, name='foodAndAgri'),
        path('computer_and_it/',views.get_csc_and_it, name='CSCandIT'),
        path('engineering/',views.get_engg_page, name='enggPage'),
        path('social_science/',views.get_social_science_page, name='socialSciencePage'),
        path('math_and_science/',views.get_math_and_science_page, name='mathAndScience'),
        path('performing_art/',views.get_performing_art_page, name='performingArt'),
        path('education_training/',views.get_education_and_training_page, name='educationTrainingPage'),
        path('social_services/',views.get_social_services_page, name='socialServicesPage'),
        path('legal_services/',views.get_legal_services_page, name='legalServicesPage'),
        path('media_and_communaction/',views.get_media_and_communaction_page, name='mediaAndCommuncation'),
        path('animation/',views.get_animation_page, name='animationPage'),
        path('design/',views.get_design_page, name='designPage'),
        path('finance_and_banking/',views.get_finance_and_banking_page, name='financeAndBanking'),
        path('Business_managment/',views.get_business_managment_page, name='businessManagment'),
        path('commerce_and_accounts/',views.get_commerce_and_account_page, name='commerceAndAccount'),
        path('architecture/',views.get_architecture_page, name='architecturePage'),
        path('social_science/',views.get_social_science_page, name='socialScience'),
        path('medical/',views.get_medical_page, name='medical'),
        path('Hospatility_and_Tourism/',views.get_hospatility_and_tourism_page, name='hospatilityAndTourism'),

        # Allied mec sub pages
         path('dental-BDS/',views.get_dental_BDS_page, name='alliedMedSic_Dental'),       
         path('vertinity-sciences/',views.get_vertinity_sciences_page, name='alliedMedSic_vertinitySciences'),       
         path('Wildlife Biology/',views.get_wildlife_biology_page, name='alliedMedSic_wildlifeBiology'),       

        #  Engg
          path('Aeronautical Engineering/',views.get_aeronautical__page, name='engg_aeroNautical'),       
          path('Aerospace Engineering/',views.get_aerospace__page, name='engg_aeroSpace'),       

        #   Food and Agri
          path('Agriculture_Science/',views.get_agri_science_page, name='foodAndAgri_agriScience'),          
          path('biology_Science/',views.get_bio_science_page, name='foodAndAgri_bioScience'),          
        #   CSC & it
          path('cyber_security/',views.get_cyber_security_page, name='CSC_IT_Cyber_Security'),                 
          path('computer_application/',views.get_computer_application_page, name='CSC_IT_Computer_Applications'),                 

        #   Social Science && Social science & humanities
          path('Earth_Science_Geography/',views.get_Earth_Science_Geography_page, name='social_science_earth_geography'),                 
          path('Environmental_Science/',views.get_Environmental_Science_page, name='social_science_environemntal_science'),                 

        #   Math and Science
          path('Statistical_Science/',views.get_Statistical_Science_page, name='math_and_science_stat_science'),                 
        #   Performing art
          path('art_restoration/',views.get_art_restoration_page, name='performing_art_art_restoration'),                 
          path('art_direction/',views.get_art_direction_page, name='performing_art_art_direction'),    

       #Educational training
          path('vocal_school/',views.get_vocal_school_page, name='education_and_training_vocal_school_page'),                 

          

]   


