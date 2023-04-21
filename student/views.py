from time import strftime
from tkinter.tix import Tree
from django.db import connection
from django.shortcuts import render,redirect
from django.http import HttpResponse
import bcrypt
import numpy as np
import matplotlib.pyplot as plt
from copy import deepcopy

from django.http import FileResponse
import io  
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from reportlab.lib.pagesizes import letter

from django.template.loader import get_template
from xhtml2pdf import pisa
from django.views.generic import ListView
from django.shortcuts import render, get_object_or_404

intelli_fields = {
    'Verbal': ['Public Speaker ',
 'Politician ',
 'Preacher' ,
 'Historian ',
 'Journalist ',
' Teacher ',
' Journalist ',
' Poet ',
' Broadcaster ',
' English / Writing Tutor ',
' Actor / Actress '
],
         'Logical':['Accountant',
'Computer analyst',
'Computer technician',
'Computer programmer',
'Database designer',
'Economist',
'Engineer',
'Lawyer',
'Mathematician',
'Network analyst',
'Pharmacist',
'Physician',
'Physicist',
'Researcher',
'Statistician'],
         
         'Spatial':[ 'Artist',
'Architect',
'Graphic Designer',
'Engineer',
'Fashion Designer',
'Interior Decorator',
'Photographer',
'Pilot',
'Sculptor',
'Strategic planner',
'Surveyor',
'Truck driver',
'Urban planner'
],
         'Musical':['Audiologist', 
'Choir director', 
'Music conductor', 
'Music critic',
'Music publisher',
'Musicpromoter',
'Music retailer',
'Music teacher',
'Music therapist',
'Piano tuner',
'Recording engineer',
'Songwriter',
'Sound editor',
'Speech pathologist'],
         
         
        'Interpersonal':['Diplomat ',
  'Leader', 
  'Manager ',
  'Politician', 
  'Clergy ',
  'Social Worker' ,
  'Receptionist', 
'Sales Representative', 
'Counselor', 
'Child Care',
'Coach' 
],
         'Naturalistic':['Astronomer',
'Botanist',
'Conservationist',
'Gardener',
'Farmer',
'Animal Trainer',
'Zookeeper',
'Geologist',
'Marine Biologist',
'Ecologist',
'Veterinarian',
'Forest ranger',
'Landscaper',
'Meteorologist',
'Nature photographer']
,
        'Kinesthetic':['Athlete',
'Dancer',
'Mechanic',
'Actor / Actress',
'Performer',
'Physical Education Instructor',
'Craftsman',
'Physical Therapist',
'Farmer',
'Carpenter',
'Builder','Park Ranger'
'Firefighter',
'Paramedic'],
         'Intrapersonal':['Psychologist',
'Philosopher',
'Writer',
'Theologian',
'Career counselor',
'Consultant',
'Criminologist',
'Energy healer',
'Personal counselor',
'Philosopher',
'Program planner']
}


dbCompannion = connection.cursor()

# Create your views here
def gethome(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'index.html')

def get_user_login(request):
    if request.session.has_key('user'):
        return redirect('/user/userProfile/')
    return render(request,'LoginForm.html')


def get_user_signup(request):
    if request.session.has_key('user'):
        return redirect('/user/userProfile/')
    return render(request,'SignUpForm.html')

def register_user(request):
    
    if request.method == "POST":
        fname = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        mobileno = request.POST['mobileno']
        pwd = request.POST['pwd']
        hashPwd = bcrypt.hashpw(pwd.encode('utf-8'),bcrypt.gensalt())
        conPwd = request.POST['conPwd']
        if fname == lname:
            return HttpResponse('Same first name and last name.')
        elif conPwd != pwd:
            return HttpResponse('Confirmed passwod dose not match !')
        else:
            dbCompannion.execute(f'INSERT INTO student(fname,lname,email,pwd,mobileno) VALUES(%s,%s,%s,%s,%s)',[fname,lname,email,hashPwd,mobileno])
            request.session['user'] = email
            return redirect('/user/dashboard/')
    else:
        return HttpResponse('201')


def get_user_dashboard(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT fname,lname FROM student WHERE email = %s',[request.session['user']])        
        user = dbCompannion.fetchone()
        return render(request,'careerProfile.html',{'fname':user[0],'lname':user[1]})
    return HttpResponse('Not Authorised')

def login_user(request):
    if request.method == 'POST':
        email = request.POST['email']
        pwd = request.POST['pwd']
        dbCompannion.execute('SELECT * FROM student WHERE email = %s',[email])
        data = dbCompannion.fetchone()
        if bcrypt.checkpw(pwd.encode('utf-8'),data[4].encode('utf-8')):
            request.session['user'] = email
            return redirect('/user/dashboard/')
        else:
            return HttpResponse('Incorrect password !')    
    else:
        return HttpResponse('201')


def get_quest(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT test FROM student WHERE email = %s',[request.session['user']])
        test_flag = dbCompannion.fetchone()[0]
        if test_flag == '0':
            return render(request,'quest/verbal.html')
        else:
            return HttpResponse('Already attempted test ! Only one attempt is allowed.')
    return HttpResponse('Not Authorised')

def handle_quest(request):
    qcat = list(request.POST.keys())[1]
    uemail = request.session['user']

    if qcat[2:] == 'c1':
        q1 = request.POST['q1c1']
        q2 = request.POST['q2c1']
        q3 = request.POST['q3c1']
        q4 = request.POST['q4c1']
        q5 = request.POST['q5c1']
        q6 = request.POST['q6c1']
        q7 = request.POST['q7c1']
        q8 = request.POST['q8c1']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/logical.html')
        #return HttpResponse([qcat[2:]])
    elif qcat[2:] == 'c2':
        q1 = request.POST['q1c2']
        q2 = request.POST['q2c2']
        q3 = request.POST['q3c2']
        q4 = request.POST['q4c2']
        q5 = request.POST['q5c2']
        q6 = request.POST['q6c2']
        q7 = request.POST['q7c2']
        q8 = request.POST['q8c2']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/Spatial.html')
    elif qcat[2:] == 'c3':        
        q1 = request.POST['q1c3']
        q2 = request.POST['q2c3']
        q3 = request.POST['q3c3']
        q4 = request.POST['q4c3']
        q5 = request.POST['q5c3']
        q6 = request.POST['q6c3']
        q7 = request.POST['q7c3']
        q8 = request.POST['q8c3']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/Musical.html')
    elif qcat[2:] == 'c4':        
        q1 = request.POST['q1c4']
        q2 = request.POST['q2c4']
        q3 = request.POST['q3c4']
        q4 = request.POST['q4c4']
        q5 = request.POST['q5c4']
        q6 = request.POST['q6c4']
        q7 = request.POST['q7c4']
        q8 = request.POST['q8c4']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/Interpersonal.html')
    elif qcat[2:] == 'c5':        
        q1 = request.POST['q1c5']
        q2 = request.POST['q2c5']
        q3 = request.POST['q3c5']
        q4 = request.POST['q4c5']
        q5 = request.POST['q5c5']
        q6 = request.POST['q6c5']
        q7 = request.POST['q7c5']
        q8 = request.POST['q8c5']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/Naturaslistic.html')
    elif qcat[2:] == 'c6':        
        q1 = request.POST['q1c6']
        q2 = request.POST['q2c6']
        q3 = request.POST['q3c6']
        q4 = request.POST['q4c6']
        q5 = request.POST['q5c6']
        q6 = request.POST['q6c6']
        q7 = request.POST['q7c6']
        q8 = request.POST['q8c6']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/Kinesthetic.html')
    elif qcat[2:] == 'c7':        
        q1 = request.POST['q1c7']
        q2 = request.POST['q2c7']
        q3 = request.POST['q3c7']
        q4 = request.POST['q4c7']
        q5 = request.POST['q5c7']
        q6 = request.POST['q6c7']
        q7 = request.POST['q7c7']
        q8 = request.POST['q8c7']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        return render(request,'quest/Intrapersonal.html')
    elif qcat[2:] == 'c8':        
        q1 = request.POST['q1c8']
        q2 = request.POST['q2c8']
        q3 = request.POST['q3c8']
        q4 = request.POST['q4c8']
        q5 = request.POST['q5c8']
        q6 = request.POST['q6c8']
        q7 = request.POST['q7c8']
        q8 = request.POST['q8c8']
        data = [(uemail,qcat[2:],q1),(uemail,qcat[2:],q2),(uemail,qcat[2:],q3),(uemail,qcat[2:],q4),(uemail,qcat[2:],q5),(uemail,qcat[2:],q6),(uemail,qcat[2:],q7),(uemail,qcat[2:],q8)]
        dbCompannion.executemany(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',data)        
        dbCompannion.execute("UPDATE student SET test = '1' WHERE email = %s",[request.session['user']])
        return redirect('/user/success/')
        

def get_success(request):
    return render(request,'success.html')


def get_report(request):
    l=[]
    dbCompannion.execute('SELECT qcat,response FROM quest WHERE email = %s',[request.session['user']])
    data =  dbCompannion.fetchall()
    
    for i in data:
        l.append(i)
    d={
        1 : 'Verbal',
        2: 'Logical',
        3: 'Spatial',
        4 : 'Musical',
        5 : 'Interpersonal',
        6 : 'Naturalistic',
        7: 'Kinesthetic',
        8: 'Intrapersonal'
    }
    
    a=[0]*8

    for i in l:
        a[int(i[0][1])-1]+=int(i[1])
    
    field = d[a.index(max(a))+1]

    
    y = np.array(a)
    #y = [i for i in y if i != 0]
    
    mylabels = ['Verbal','Logical','Spatial','Musical','Interpersonal','Naturalistic','Kinesthetic','Intrapersonal']

    modified_score = []
    modified_labels = []

    for index,score in enumerate(y):
        if score != 0:
            modified_labels.append(mylabels[index])
            modified_score.append(score)
        
    modified_score,modified_labels = zip(*sorted(zip(modified_score, modified_labels)))

    reversed_modified_score = deepcopy(modified_score)
    reversed_modified_labels = deepcopy(modified_labels)

    print(modified_score[-2:])

   
    plt.figure(figsize=(8,8))
    plt.pie(modified_score, labels = modified_labels,autopct='%1.1f%%',textprops={'fontsize':17})
    #plt.legend(title = "Expertise:")
    plt.tight_layout()
    plt.savefig('student/static/analysis.png')
    return render(request,'user/report.html',{'report':'analysis.png','field':field,'intelli_fields':intelli_fields.get(field)})


def get_dashboard(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT fname,lname FROM student WHERE email = %s',[request.session['user']])        
        user = dbCompannion.fetchone()
        return render(request,'user/dashboard.html',{'fname':user[0],'lname':user[1]})
    else:
        return redirect('/user/')

def get_assesment(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT fname,lname FROM student WHERE email = %s',[request.session['user']])        
        user = dbCompannion.fetchone()
        return render(request,'user/assessment.html',{'fname':user[0],'lname':user[1]})
    else:
        return redirect('/user/')


def get_home(request):
    if request.session.has_key('user'):
        return render(request,'index.html')
    else:
        return redirect('/user/')


def get_user_profile(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT fname,lname,email,mobileno, sid, DOB, gender, age, currentEducation, income, goals FROM student WHERE email = %s',[request.session['user']])        
        user = dbCompannion.fetchone()
        print(user[5])
        return render(request,'user/profile.html',{'fname':user[0],'lname':user[1], 'email':user[2], 'mobileno': user[3], 'sid': user[4],'dob' : user[5], 'gender': user[6], 'age': user[7], 'currentEducation': user[8],'income': user[9],'goals': user[10] })
    else:
        return redirect('/user/')
    

def logout_user(request):
    request.session.flush()
    return redirect('/user/')

def get_user_quiz(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT fname,lname,sid,email FROM student WHERE email = %s',[request.session['user']])        
        user = dbCompannion.fetchone()
        return render(request,'user/question.html',{'fname':user[0],'lname':user[1],'sid':user[2],'email':user[3]})
    return HttpResponse('Not Authorised')

def update_profile_page(request):
    if request.session.has_key('user'):
        dbCompannion.execute('SELECT fname,lname,email,mobileno, sid, DOB, gender, age, currentEducation, income, goals FROM student WHERE email = %s',[request.session['user']])        
        user = dbCompannion.fetchone()
        return render(request,'updateProfile.html',{'fname':user[0],'lname':user[1], 'email':user[2], 'mobileno': user[3], 'sid': user[4],'DOB' : user[5], 'gender': user[6], 'age': user[7], 'currentEducation': user[8],'income': user[9],'goals': user[10] })
    else:
        return redirect('/user/')

def saveResponse(request):
    if request.method == "POST":
        user_id = request.POST['user_id']
        user_email = request.POST['user_email']
        # question = request.POST['question']
        category = request.POST['category']
        option = request.POST['option']
       
        dbCompannion.execute(f'INSERT INTO quest(email,qcat,response) VALUES(%s,%s,%s)',[user_email,category,option])
        return HttpResponse('Success')
        
def get_pdf(request):

    template_path = 'user/report_pdf.html'

    # Create a Django response object, and specify content_type as pdf
    response = HttpResponse(content_type='application/pdf')
    # to directly download the pdf we need attachment 
    # response['Content-Disposition'] = 'attachment; filename="report.pdf"'

    # to view on browser we can remove attachment 
    response['Content-Disposition'] = 'filename="report.pdf"'

    # find the template and render it.
    template = get_template(template_path)
    html = template.render()

    # create a pdf
    pisa_status = pisa.CreatePDF(
      html, dest=response)
    # if error then show some funy view
    if pisa_status.err:
      return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response

# def get_pdf(request):
#     buf = io.BytesIO()
#     c= canvas.Canvas(buf,pagesize=letter,bottomup=0)
#     textob = c.beginText()
#     textob.setTextOrigin(inch, inch)
#     textob.setFont("Helvetica",14)

#     lines = [
#         "<h1>THis is my line 1</h1>",
#         "THis is my line 2",
#         "THis is my line 3"
#     ]

#     for line in lines:
#         textob.textLine(line)

#     c.drawText(textob)
#     c.showPage()
#     c.save()
#     buf.seek(0)

#     return FileResponse(buf,as_attachment=True,filename='report.pdf')

def update_profile(request):
    if request.method == "POST":
        fname = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        mobileno = request.POST['mobileno']
        sid = request.POST['sid']
        dob = request.POST['dob']
        gender = request.POST['gender']
        age = request.POST['age']
        education = request.POST['education']
        income = request.POST['income']
        goals = request.POST['goals']
        
        dbCompannion.execute(f'UPDATE student SET fname=%s, lname=%s, mobileno=%s, email= %s, DOB=%s, gender=%s, age=%s, currentEducation=%s, income=%s, goals=%s WHERE sid=%s',[fname, lname, mobileno, email, dob, gender, age, education, income, goals, sid])
        return redirect('/user/userProfile')
   

def get_about_us(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'About.html')

def get_multiple_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/multiple_intelligence.html')


def get_musical_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/musical.html')

def get_logical_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/logical.html')

def get_linguistic_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/linguistic.html')


def get_intraPersonal_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/intrapersonal.html')
    
def get_interPersonal_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/interpersonal.html')

    
def get_kinesthetic_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/kinesthetic.html')

def get_visual_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/visual.html')

def get_naturalistic_intelligence_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'intelligence/naturalistic.html')

def get_career_wiki_main_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Career_Library.html')
    
def get_allied_medical_science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Allied_medical_sci.html')

def get_food_add_agri_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Food_agri.html')

def get_csc_and_it(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/computer_&_IT.html')


def get_engg_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/engg.html')

def get_social_science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/social_science.html')

def get_math_and_science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/math_&_stat.html')

def get_performing_art_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/performing_arts.html')

def get_education_and_training_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Education_&_training.html')

def get_social_services_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/social_services.html')

def get_legal_services_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/legal_services.html')

def get_media_and_communaction_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/media_&_comm.html')
    

def get_animation_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/animation.html')

def get_design_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/design.html')


def get_finance_and_banking_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/finance_&_banking.html')


def get_business_managment_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/business_management.html')


def get_commerce_and_account_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Commerce_&_acc.html')


def get_architecture_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/architecture.html')

def get_social_science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/social_science.html')


def get_medical_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/medical.html')

def get_hospatility_and_tourism_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Hospitality_&_tourism.html')

def get_dental_BDS_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/allied medical sci/dental.html')

def get_vertinity_sciences_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/allied medical sci/veterinary.html')

def get_wildlife_biology_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/allied medical sci/wildlife.html')

def get_aeronautical__page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/enggineering/aeronautical.html')

def get_aerospace__page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/enggineering/aerospace.html')

def get_agri_science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Food_agri/agricultural.html')

def get_bio_science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/Food_agri/biological_sci.html')

def get_cyber_security_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/comp application & IT/cyber_security.html')

def get_computer_application_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/comp application & IT/computer_app.html')

def get_Earth_Science_Geography_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/social science/earth_science.html')

def get_Environmental_Science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/social science/envoirnmental_sci.html')

def get_Statistical_Science_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/math and stat/statistics.html')

def get_art_restoration_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/performong arts/art_restoration.html')
    
def get_art_direction_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/performong arts/Art Direction.html')

def get_vocal_school_page(request):
    if request.session.has_key('user'):
        return redirect('/user/dashboard/')
    return render(request,'Career_Wiki/education and training/vocal_school.html')