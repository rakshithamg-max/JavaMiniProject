<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Product Management System</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=DM+Sans:ital,wght@0,300;0,400;0,500;1,300&display=swap" rel="stylesheet">

<style>

*, *::before, *::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --ink:        #1a0533;
  --ink-soft:   #3d2460;
  --ink-muted:  #7b5ea7;
  --surface:    #f3eeff;
  --surface-2:  #ebe0ff;
  --surface-3:  #d9c5f7;
  --accent:     #6c2bd9;
  --accent-2:   #5a1fc4;
  --amber:      #f59e0b;
  --red:        #ef4444;
  --teal:       #0d9488;
  --violet:     #7c3aed;
  --green:      #10b981;
  --radius-lg:  18px;
  --radius-md:  12px;
  --radius-sm:  8px;
  --shadow-sm:  0 1px 3px rgba(0,0,0,.06), 0 1px 2px rgba(0,0,0,.04);
  --shadow-md:  0 4px 16px rgba(0,0,0,.08), 0 1px 4px rgba(0,0,0,.04);
  --shadow-lg:  0 12px 40px rgba(0,0,0,.10), 0 2px 8px rgba(0,0,0,.05);
}

/* ── Page shell ── */
body {
  font-family: 'DM Sans', sans-serif;
  background-color: #e8d5ff;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

/* ── Real top navigation bar ── */
.topbar {
  position: fixed;
  top: 0; left: 0; right: 0;
  height: 60px;
  background: var(--surface);
  border-bottom: 1px solid var(--surface-3);
  display: flex;
  align-items: center;
  padding: 0 32px;
  gap: 0;
  z-index: 100;
  box-shadow: var(--shadow-sm);
}

.topbar-brand {
  display: flex;
  align-items: center;
  gap: 10px;
  text-decoration: none;
  margin-right: 40px;
}

.topbar-brand .brand-icon {
  width: 32px;
  height: 32px;
  background: var(--accent);
  border-radius: var(--radius-sm);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  flex-shrink: 0;
}

.topbar-brand span {
  font-family: 'Syne', sans-serif;
  font-weight: 700;
  font-size: 15px;
  color: var(--ink);
  letter-spacing: -0.3px;
}

.topbar-nav {
  display: flex;
  align-items: center;
  gap: 2px;
  flex: 1;
}

.nav-link {
  font-size: 13.5px;
  font-weight: 500;
  color: var(--ink-muted);
  text-decoration: none;
  padding: 6px 14px;
  border-radius: var(--radius-sm);
  transition: color .15s, background .15s;
}

.nav-link:hover { color: var(--ink); background: var(--surface-2); }
.nav-link.active { color: var(--accent); background: rgba(108,43,217,.10); }

.topbar-right {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-left: auto;
}

.topbar-btn {
  font-size: 13px;
  font-weight: 500;
  color: var(--ink-soft);
  background: var(--surface-2);
  border: 1px solid var(--surface-3);
  border-radius: var(--radius-sm);
  padding: 6px 14px;
  cursor: pointer;
  text-decoration: none;
  transition: background .15s, border-color .15s;
}

.topbar-btn:hover { background: var(--surface-3); }

.topbar-avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--accent), var(--violet));
  color: #fff;
  font-size: 13px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-family: 'Syne', sans-serif;
}

/* ── Layout ── */
.layout {
  display: flex;
  margin-top: 60px;
  min-height: calc(100vh - 60px);
}

/* ── Sidebar ── */
.sidebar {
  width: 220px;
  flex-shrink: 0;
  background: var(--surface);
  border-right: 1px solid var(--surface-3);
  padding: 24px 12px;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.sidebar-section-label {
  font-size: 10.5px;
  font-weight: 600;
  color: var(--ink-muted);
  letter-spacing: .08em;
  text-transform: uppercase;
  padding: 8px 10px 4px;
  margin-top: 8px;
}

.sidebar-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 9px 10px;
  border-radius: var(--radius-sm);
  font-size: 13.5px;
  font-weight: 500;
  color: var(--ink-soft);
  text-decoration: none;
  cursor: pointer;
  transition: background .15s, color .15s;
}

.sidebar-item:hover { background: var(--surface-2); color: var(--ink); }
.sidebar-item.active { background: rgba(108,43,217,.10); color: var(--accent); }

.sidebar-item .si-icon {
  width: 28px;
  height: 28px;
  border-radius: var(--radius-sm);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 15px;
  flex-shrink: 0;
  background: var(--surface-2);
}

.sidebar-item.active .si-icon { background: rgba(108,43,217,.14); }

.sidebar-badge {
  margin-left: auto;
  font-size: 11px;
  font-weight: 600;
  background: var(--surface-3);
  color: var(--ink-muted);
  padding: 1px 7px;
  border-radius: 20px;
}

/* ── Main content ── */
.main {
  flex: 1;
  padding: 32px 36px;
  overflow-y: auto;
}

/* ── Page header ── */
.page-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  margin-bottom: 28px;
}

.page-title {
  font-family: 'Syne', sans-serif;
  font-size: 24px;
  font-weight: 700;
  color: var(--ink);
  letter-spacing: -0.5px;
  margin-bottom: 4px;
}

.page-subtitle {
  font-size: 13.5px;
  color: var(--ink-muted);
  font-weight: 400;
}

.page-header-actions {
  display: flex;
  gap: 10px;
}

.ph-btn {
  font-size: 13px;
  font-weight: 500;
  padding: 8px 18px;
  border-radius: var(--radius-sm);
  cursor: pointer;
  text-decoration: none;
  border: none;
  transition: filter .15s, transform .12s;
}

.ph-btn:hover { filter: brightness(.94); transform: translateY(-1px); }

.ph-btn-primary {
  background: var(--accent);
  color: #fff;
}

.ph-btn-secondary {
  background: var(--surface);
  color: var(--ink-soft);
  border: 1px solid var(--surface-3);
}

/* ── Alert strip ── */
.alert {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px 16px;
  border-radius: var(--radius-md);
  font-size: 13.5px;
  font-weight: 500;
  margin-bottom: 22px;
  background: rgba(16, 185, 129, 0.08);
  border: 1px solid rgba(16, 185, 129, 0.22);
  color: #065f46;
  animation: slideDown .35s ease both;
}

.alert::before { content: '✓'; font-weight: 700; color: var(--green); }

@keyframes slideDown {
  from { opacity: 0; transform: translateY(-8px); }
  to   { opacity: 1; transform: translateY(0); }
}


/* ── Action cards ── */
.section-label {
  font-size: 12px;
  font-weight: 600;
  color: var(--ink-muted);
  text-transform: uppercase;
  letter-spacing: .08em;
  margin-bottom: 14px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 14px;
  margin-bottom: 14px;
}

.action-card {
  background: var(--surface);
  border: 1px solid var(--surface-3);
  border-radius: var(--radius-lg);
  padding: 20px 22px;
  display: flex;
  align-items: center;
  gap: 16px;
  text-decoration: none;
  box-shadow: var(--shadow-sm);
  transition: box-shadow .2s, transform .18s, border-color .2s;
  cursor: pointer;
}

.action-card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
  border-color: rgba(0,0,0,.1);
}

.ac-icon {
  width: 44px;
  height: 44px;
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  flex-shrink: 0;
}

.ac-icon-add    { background: rgba(42,110,245,.10); }
.ac-icon-update { background: rgba(245,158,11,.10); }
.ac-icon-delete { background: rgba(239,68,68,.10);  }
.ac-icon-view   { background: rgba(13,148,136,.10); }
.ac-icon-report { background: rgba(124,58,237,.10); }

.ac-body {}

.ac-title {
  font-size: 14px;
  font-weight: 600;
  color: var(--ink);
  margin-bottom: 2px;
}

.ac-desc {
  font-size: 12.5px;
  color: var(--ink-muted);
  font-weight: 400;
}

.ac-arrow {
  margin-left: auto;
  color: var(--surface-3);
  font-size: 18px;
  flex-shrink: 0;
  transition: color .18s, transform .18s;
}

.action-card:hover .ac-arrow {
  color: var(--ink-muted);
  transform: translateX(3px);
}

/* Wide card */
.action-card-wide {
  grid-column: 1 / -1;
}

/* ── Footer ── */
.app-footer {
  padding: 18px 36px;
  border-top: 1px solid var(--surface-3);
  font-size: 12px;
  color: var(--ink-muted);
  display: flex;
  justify-content: space-between;
  background: var(--surface);
}

</style>

</head>
<body>

<!-- ── Top navigation bar ── -->
<header class="topbar">
  <a href="#" class="topbar-brand">
    <div class="brand-icon">📦</div>
    <span>Product Manegment System</span>
  </a>

  <nav class="topbar-nav">
    <a href="#" class="nav-link active">Dashboard</a>
    <a href="DisplayProductsServlet" class="nav-link">Products</a>
    <a href="report_form.jsp" class="nav-link">Reports</a>
  </nav>
</header>

<!-- ── Layout ── -->
<div class="layout">

  <!-- ── Sidebar ── -->
  <aside class="sidebar">
    <span class="sidebar-section-label">Catalog</span>
    <a href="productadd.jsp" class="sidebar-item">
      <div class="si-icon">➕</div> Add Product
    </a>
    <a href="DisplayProductsServlet" class="sidebar-item">
      <div class="si-icon">📋</div> All Products
      <span class="sidebar-badge">—</span>
    </a>
    <a href="productupdate.jsp" class="sidebar-item">
      <div class="si-icon">✏️</div> Edit Product
    </a>
    <a href="productdelete.jsp" class="sidebar-item">
      <div class="si-icon">🗑️</div> Delete Product
    </a>

    <span class="sidebar-section-label">Analytics</span>
    <a href="report_form.jsp" class="sidebar-item">
      <div class="si-icon">📊</div> Reports
    </a>
  </aside>

  <!-- ── Main ── -->
  <main class="main">

    <!-- Page header -->
    <div class="page-header">
      <div>
        <h1 class="page-title">Dashboard</h1>
        <p class="page-subtitle">Manage your product catalog and inventory</p>
      </div>
      <div class="page-header-actions">
        <a href="report_form.jsp" class="ph-btn ph-btn-secondary">View Reports</a>
        <a href="productadd.jsp" class="ph-btn ph-btn-primary">+ Add Product</a>
      </div>
    </div>

    <!-- Success alerts -->
    <%
      String msg = request.getParameter("msg");
      if ("added".equals(msg)) {
    %>
      <div class="alert">Product added successfully</div>
    <%
      }
      if ("updated".equals(msg)) {
    %>
      <div class="alert">Product updated successfully</div>
    <%
      }
      if ("deleted".equals(msg)) {
    %>
      <div class="alert">Product deleted successfully</div>
    <%
      }
    %>

    <!-- Action cards -->
    <div class="section-label">Quick Actions</div>

    <div class="grid">

      <a href="productadd.jsp" class="action-card">
        <div class="ac-icon ac-icon-add">➕</div>
        <div class="ac-body">
          <p class="ac-title">Add Product</p>
          <p class="ac-desc">Create a new catalog listing</p>
        </div>
        <div class="ac-arrow">›</div>
      </a>

      <a href="productupdate.jsp" class="action-card">
        <div class="ac-icon ac-icon-update">✏️</div>
        <div class="ac-body">
          <p class="ac-title">Update Product</p>
          <p class="ac-desc">Edit details of an existing item</p>
        </div>
        <div class="ac-arrow">›</div>
      </a>

      <a href="productdelete.jsp" class="action-card">
        <div class="ac-icon ac-icon-delete">🗑️</div>
        <div class="ac-body">
          <p class="ac-title">Delete Product</p>
          <p class="ac-desc">Remove an item from the catalog</p>
        </div>
        <div class="ac-arrow">›</div>
      </a>

      <a href="DisplayProductsServlet" class="action-card">
        <div class="ac-icon ac-icon-view">📋</div>
        <div class="ac-body">
          <p class="ac-title">View Products</p>
          <p class="ac-desc">Browse all inventory items</p>
        </div>
        <div class="ac-arrow">›</div>
      </a>

      <a href="report_form.jsp" class="action-card action-card-wide">
        <div class="ac-icon ac-icon-report">📊</div>
        <div class="ac-body">
          <p class="ac-title">Reports &amp; Analytics</p>
          <p class="ac-desc">Sales trends, inventory summaries, and performance insights</p>
        </div>
        <div class="ac-arrow">›</div>
      </a>

    </div>

  </main>
</div>

<!-- ── Footer ── -->
<footer class="app-footer">
  <span>© 2026 ProStock — Product Management System</span>
  <span>v1.0.0</span>
</footer>

</body>
</html>
