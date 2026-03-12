@echo off
chcp 65001 >nul
echo 开始更新新闻...
python -c "import json,random;from datetime import datetime;f=r'C:\inetpub\wwwroot\admin\news.json';n=json.load(open(f,encoding='utf-8')) if open(f,'r',encoding='utf-8') else [];kws=[('行业动态','半导体封装设备'),('行业动态','IGBT 封装'),('技术动态','真空共晶炉'),('技术动态','银烧结')];ts=['据行业媒体报道，%s领域近期迎来新的发展机遇。','技术专家指出，%s工艺参数优化对提升产品良率至关重要。'];[(n.insert(0,{'id':datetime.now().strftime('%%Y%%m%%d%%H%%M%%S')+str(random.randint(1000,9999)),'title':'%s最新进展'%kw,'date':datetime.now().strftime('%%Y-%%m-%%d'),'category':cat,'excerpt':(t%%kw)[:100]+'...','content':t%%kw,'author':'编辑部','views':random.randint(100,500)}) for cat,kw in kws for t in [random.choice(ts)]]);json.dump(n[:100],open(f,'w',encoding='utf-8'),ensure_ascii=False,indent=2);print('更新完成，共',len(n),'条新闻')]"
echo 完成！
pause
