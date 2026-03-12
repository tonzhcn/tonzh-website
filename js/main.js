// 中科同志科技官方网站 - 主脚本

document.addEventListener('DOMContentLoaded', function() {
    // 移动端导航切换
    const navToggle = document.querySelector('.nav-toggle');
    const navMenu = document.querySelector('.nav-menu');

    if (navToggle) {
        navToggle.addEventListener('click', function() {
            navMenu.classList.toggle('active');
        });
    }

    // 导航栏滚动效果
    const navbar = document.querySelector('.navbar');
    let lastScroll = 0;

    window.addEventListener('scroll', function() {
        const currentScroll = window.pageYOffset;

        if (currentScroll > 100) {
            navbar.style.boxShadow = '0 4px 20px rgba(0,0,0,0.15)';
        } else {
            navbar.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
        }

        lastScroll = currentScroll;
    });

    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // 动态加载新闻列表
    loadNewsList();
});

// 加载新闻列表
function loadNewsList() {
    const newsList = document.getElementById('news-list');
    if (!newsList) return;

    // 从 CMS 数据文件加载新闻
    fetch('/admin/news.json')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(news => {
            displayNews(news.slice(0, 3), newsList);
        })
        .catch(error => {
            console.log('加载新闻失败，显示示例内容');
            displaySampleNews(newsList);
        });
}

// 显示新闻
function displayNews(news, container) {
    container.innerHTML = news.map(item => `
        <article class="news-card">
            <div class="news-image">📰</div>
            <div class="news-content">
                <span class="news-category">${item.category}</span>
                <h3 class="news-title">${item.title}</h3>
                <p class="news-excerpt">${item.excerpt}</p>
                <div class="news-meta">
                    <span>📅 ${item.date}</span>
                    <span>👁️ ${item.views || 0} 阅读</span>
                </div>
            </div>
        </article>
    `).join('');
}

// 示例新闻（当 CMS 数据不存在时）
function displaySampleNews(container) {
    const sampleNews = [
        {
            category: '行业动态',
            title: '半导体封装设备市场持续增长，国产替代加速',
            excerpt: '2026 年全球半导体封装设备市场规模预计突破 100 亿美元，中国市场需求旺盛...',
            date: '2026-03-10',
            views: 1280
        },
        {
            category: '技术动态',
            title: '纳米银烧结技术取得突破，可靠性提升 50%',
            excerpt: '中科同志研发团队在纳米银烧结工艺上取得重大进展，为车规级功率模块封装提供新方案...',
            date: '2026-03-08',
            views: 956
        },
        {
            category: '公司新闻',
            title: 'TORCH 荣获 2026 年度半导体创新企业奖',
            excerpt: '在第十二届中国半导体行业协会年会上，中科同志科技凭借技术创新荣获年度创新企业奖...',
            date: '2026-03-05',
            views: 2103
        }
    ];

    displayNews(sampleNews, container);
}

// 表单提交处理
function handleFormSubmit(formId, callback) {
    const form = document.getElementById(formId);
    if (!form) return;

    form.addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(form);
        const data = Object.fromEntries(formData.entries());

        // 这里可以集成表单提交服务
        if (callback) {
            callback(data);
        }

        // 显示成功消息
        alert('提交成功！我们会尽快与您联系。');
        form.reset();
    });
}
