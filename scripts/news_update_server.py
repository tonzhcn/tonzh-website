#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
直接在服务器上运行的新闻更新脚本
不需要文件传输，直接在服务器生成新闻
"""

import json
import random
from datetime import datetime

# 配置
NEWS_FILE = r"C:\inetpub\wwwroot\admin\news.json"

# 搜索关键词
KEYWORDS = {
    "行业动态": [
        "半导体封装设备", "IGBT 封装", "SiC 功率器件", "SMT 设备", 
        "PCB 设备", "真空焊接设备", "亚微米贴片机", "半导体设备国产化"
    ],
    "技术动态": [
        "真空共晶炉技术", "银烧结工艺", "TCB 热压键合", "半导体焊接技术",
        "芯片封装工艺", "真空回流焊", "MEMS 封装技术", "晶圆键合技术"
    ]
}

# 文章模板
TEMPLATES = {
    "行业动态": [
        "据行业媒体报道，{keyword}领域近期迎来新的发展机遇。随着下游应用需求的持续增长，相关设备制造商正加大研发投入，提升产品性能。业内人士指出，{keyword}市场前景广阔，预计未来几年将保持稳步增长态势。",
        "最新市场研究显示，{keyword}市场规模持续扩大。受益于新能源汽车、光伏储能等行业的快速发展，{keyword}设备需求旺盛。多家企业表示，订单量同比增长显著，产能利用率维持高位。",
        "行业分析机构发布报告称，{keyword}技术创新步伐加快。新一代产品在精度、效率、可靠性等方面均有显著提升，为满足高端制造需求提供了有力支撑。",
        "从近期行业展会传来消息，{keyword}成为关注焦点。参展企业展示了最新技术成果，吸引众多专业观众驻足。业内人士认为，{keyword}正朝着智能化、高精度方向发展。"
    ],
    "技术动态": [
        "技术专家指出，{keyword}工艺参数优化对提升产品良率至关重要。通过精确控制温度曲线、真空度等关键参数，可有效降低焊接空洞率，提高封装可靠性。",
        "研发团队在{keyword}领域取得新的技术突破。新型设计方案在保持高可靠性的同时，显著提升了生产效率。该技术已申请多项专利，有望在近期实现产业化应用。",
        "工艺工程师分享了{keyword}的实践经验。通过优化设备配置和工艺流程，可在保证产品质量的前提下，有效降低生产成本。该方案已在多个项目中成功实施。",
        "技术文献显示，{keyword}在先进封装领域应用前景广阔。相比传统工艺，新技术在精度、效率、环保等方面具有明显优势。"
    ]
}

def load_news():
    """加载现有新闻"""
    try:
        with open(NEWS_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    except:
        return []

def save_news(news_list):
    """保存新闻"""
    with open(NEWS_FILE, 'w', encoding='utf-8') as f:
        json.dump(news_list, f, ensure_ascii=False, indent=2)

def generate_news_id():
    """生成新闻 ID"""
    return datetime.now().strftime("%Y%m%d%H%M%S") + str(random.randint(1000, 9999))

def main():
    """主函数"""
    print(f"开始执行新闻自动更新 - {datetime.now()}")
    
    # 加载现有新闻
    news_list = load_news()
    
    # 每个栏目生成 2 篇新闻
    for category, keywords in KEYWORDS.items():
        print(f"\n处理栏目：{category}")
        
        # 随机选择 2 个关键词
        selected = random.sample(keywords, min(2, len(keywords)))
        
        for keyword in selected:
            print(f"  - 生成：{keyword}")
            
            # 生成内容
            template = random.choice(TEMPLATES[category])
            content = template.format(keyword=keyword)
            
            # 创建新闻
            today = datetime.now().strftime("%Y-%m-%d")
            news_item = {
                "id": generate_news_id(),
                "title": f"{keyword}最新进展 - XXXX 公司发布新技术",
                "date": today,
                "category": category,
                "excerpt": content[:100] + "...",
                "content": content,
                "author": "编辑部",
                "views": random.randint(100, 500),
                "keywords": keyword
            }
            
            news_list.insert(0, news_item)
            print(f"    ✓ 已生成")
    
    # 保留最近 100 条
    news_list = news_list[:100]
    
    # 保存
    save_news(news_list)
    
    print(f"\n✓ 完成！共 {len(news_list)} 条新闻")
    print(f"文件位置：{NEWS_FILE}")

if __name__ == "__main__":
    main()
